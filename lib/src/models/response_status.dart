enum ResponseStatus {
  /// indicates that no errors occurred; the address was successfully parsed and at least one geocode was returned.
  ok('OK'),

  /// indicates that the geocode was successful but returned no results. This may occur if the geocoder was passed a non-existent address.
  zeroResult('ZERO_RESULTS'),

  /// indicates any of the following:
  /// The API key is missing or invalid.
  /// Billing has not been enabled on your account.
  /// A self-imposed usage cap has been exceeded.
  /// The provided method of payment is no longer valid (for example, a credit card has expired).
  overDailyLimit('OVER_DAILY_LIMIT'),

  /// indicates that you are over your quota.
  overQueryLimit('OVER_QUERY_LIMIT'),

  /// REQUEST_DENIED indicating that your request was denied, generally because:
  /// The request is missing an API key.
  /// The key parameter is invalid.
  requestDenied('REQUEST_DENIED'),

  /// generally indicates that the query (address, components or latlng) is missing.
  invalidRequest('INVALID_REQUEST'),

  ///  indicates that the request could not be processed due to a server error. The request may succeed if you try again.
  unknownError('UNKNOWN_ERROR');

  const ResponseStatus(this.value);

  factory ResponseStatus.fromValue(String value) {
    if (value == 'OK') return ok;
    if (value == 'ZERO_RESULTS') return zeroResult;
    if (value == 'OVER_DAILY_LIMIT') return overDailyLimit;
    if (value == 'OVER_QUERY_LIMIT') return overQueryLimit;
    if (value == 'REQUEST_DENIED') return requestDenied;
    if (value == 'INVALID_REQUEST') return invalidRequest;
    if (value == 'UNKNOWN_ERROR') return unknownError;
    return unknownError;
  }

  final String value;

  @override
  String toString() => value;
}
