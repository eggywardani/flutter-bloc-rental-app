import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/domain/usecases/blocs/car_bloc.dart';
import 'package:rental_app/domain/usecases/blocs/car_state.dart';
import 'package:rental_app/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CarError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is CarLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
