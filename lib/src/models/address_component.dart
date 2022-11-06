///
///
///
class AddressComponent {
  const AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  final String longName;
  final String shortName;
  final List<String> types;

  @override
  String toString() {
    return 'AddressComponent{ longName: $longName, shortName: $shortName, types: $types,}';
  }

  factory AddressComponent.fromMap(Map<String, dynamic> map) {
    return AddressComponent(
      longName: map['long_name'],
      shortName: map['short_name'],
      types: map['types'].cast<String>(),
    );
  }
}

///
///
///
List<AddressComponent>? parseAddressComponentArray(List? items) {
  if (items == null) return null;
  final components = <AddressComponent>[];
  for (final item in items) {
    final comp = AddressComponent.fromMap(item);
    components.add(comp);
  }
  return components;
}
