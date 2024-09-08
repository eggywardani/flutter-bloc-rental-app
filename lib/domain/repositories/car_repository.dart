import 'package:rental_app/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
