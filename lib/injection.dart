import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rental_app/data/datasources/firebase_car_data.dart';
import 'package:rental_app/data/repositories/car_repository.dart';
import 'package:rental_app/domain/usecases/blocs/car_bloc.dart';
import 'package:rental_app/domain/usecases/get_cars.dart';

GetIt sl = GetIt.instance;

void initInjection() {
  try {
    sl.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    sl.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: sl()));
    sl.registerLazySingleton<CarRepositoryImpl>(
        () => CarRepositoryImpl(dataSource: sl()));
    sl.registerLazySingleton<GetCars>(() => GetCars(sl()));

    sl.registerFactory<CarBloc>(() => CarBloc(dataSource: sl()));
  } catch (e) {
    rethrow;
  }
}
