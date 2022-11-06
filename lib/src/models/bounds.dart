import 'lat_lng_literal.dart';

///
///
///
class Bounds {
  const Bounds({
    required this.northeast,
    required this.southwest,
  });

  final LatLngLiteral northeast;
  final LatLngLiteral southwest;

  @override
  String toString() {
    return 'Bounds{ northeast: $northeast, southwest: $southwest,}';
  }

  factory Bounds.fromMap(Map<String, dynamic> map) {
    return Bounds(
      northeast: LatLngLiteral.fromMap(map['northeast']),
      southwest: LatLngLiteral.fromMap(map['southwest']),
    );
  }
}
