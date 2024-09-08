import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rental_app/data/model/car.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    final result = await firestore.collection('cars').get();
    return result.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
