import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/data/datasources/firebase_car_data.dart';
import 'package:rental_app/domain/usecases/blocs/car_event.dart';
import 'package:rental_app/domain/usecases/blocs/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FirebaseCarDataSource dataSource;
  CarBloc({required this.dataSource}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await dataSource.getCars();
        print('statement : $cars');
        emit(CarLoaded(cars));
      } catch (e, s) {
        print('statement : $s');
        emit(CarError(e.toString()));
      }
    });
  }
}
