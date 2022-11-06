import 'dart:convert';

import 'package:http/http.dart';
import 'package:logging/logging.dart';

abstract class GoogleWebService {
  GoogleWebService({
    required String serviceName,
    required Uri baseUri,
    String? apiKey,
    this.debug = false,
  })
      : _log = Logger(serviceName),
        _apiKey = apiKey,
        _language = 'en',
        _baseUri = baseUri,
        _httpClient = Client();

  String? _apiKey;
  String _language;
  final bool debug;
  final Logger _log;
  final Uri _baseUri;
  final Client _httpClient;

  ///
  ///
  ///
  String? get apiKey => _apiKey;

  ///
  ///
  ///
  String get language => _language;

  ///
  ///
  ///
  void setApiKey(String key) => _apiKey = key;

  ///
  ///
  ///
  void setLanguage(String language) => _language = language;

  ///
  ///
  ///
  Future<dynamic> doGet({
    required String path,
    required Map<String, dynamic> params,
  }) async {
    final uri = _getFinalUri(path, params);
    if (debug) {
      _log.info('Request: ${uri.toString()}');
    }

    try {
      final response = await _httpClient.get(uri);
      final data = json.decode(response.body);
      if (debug) {
        _log.info('Response url: ${uri.toString()}, data: $data');
      }

      return data;
    } catch (error, stacktrace) {
      if (debug) {
        _log.warning(
          'Request failed: ${uri.toString()}',
          error,
          stacktrace,
        );
      }

      rethrow;
    }
  }

  ///
  ///
  ///
  Uri _getFinalUri(String path, Map<String, dynamic> params) {
    final qParams = Map.of(params);
    if (!params.containsKey('key') && _apiKey != null) {
      qParams['key'] = _apiKey;
    }

    if (!params.containsKey('language')) {
      qParams['language'] = _language;
    }

    final query = <String>[];
    qParams.forEach((key, value) {
      if (value != null) {
        if (value is Iterable) {
          query.add('$key=${value.map((v) => v.toString()).join('|')}');
        } else {
          query.add('$key=${value.toString()}');
        }
      }
    });

    final q = query.join('&');

    final uri = Uri.parse('${_baseUri.toString()}/$path?$q');
    return uri;
  }

  void dispose() {
    _httpClient.close();
  }
}
