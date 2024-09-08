import 'package:rental_app/data/datasources/firebase_car_data.dart';
import 'package:rental_app/data/model/car.dart';
import 'package:rental_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;
  CarRepositoryImpl({required this.dataSource});
  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
