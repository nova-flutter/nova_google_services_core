import 'bounds.dart';
import 'lat_lng_literal.dart';

class Geometry {
  const Geometry({
    this.bounds,
    required this.location,
    this.locationType,
    required this.viewport,
  });

  final Bounds? bounds;
  final LatLngLiteral location;
  final String? locationType;
  final Bounds viewport;

  @override
  String toString() {
    return 'Geometry{ bounds: $bounds, location: $location, locationType: $locationType, viewport: $viewport,}';
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      bounds: map['bounds'] == null ? null : Bounds.fromMap(map['bounds']),
      location: LatLngLiteral.fromMap(map['location']),
      locationType: map['location_type'],
      viewport: Bounds.fromMap(map['viewport']),
    );
  }
}
