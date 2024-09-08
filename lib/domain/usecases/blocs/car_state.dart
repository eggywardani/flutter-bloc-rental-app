import 'package:rental_app/data/model/car.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;
  CarLoaded(this.cars);
}

class CarError extends CarState {
  final String message;
  CarError(this.message);
}
