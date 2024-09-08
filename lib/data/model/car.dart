class Car {
  final String model;
  final num distance;
  final num fuelCapacity;
  final num pricePerHour;

  Car(
      {required this.model,
      required this.distance,
      required this.fuelCapacity,
      required this.pricePerHour});

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
        model: map['model'] ?? "",
        distance: map['distance'] ?? 0,
        fuelCapacity: map['fuelCapacity'] ?? 0,
        pricePerHour: map['pricePerHour'] ?? 0);
  }
}
