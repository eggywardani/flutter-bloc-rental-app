import 'package:rental_app/data/model/car.dart';
import 'package:rental_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository carRepository;

  GetCars(this.carRepository);

  Future<List<Car>> call() async {
    return await carRepository.fetchCars();
  }
}
