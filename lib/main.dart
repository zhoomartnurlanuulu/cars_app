import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/screens/cars/cars_screen.dart';

import 'bloc/cars_bloc.dart';
import 'repositories/car_repository.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CarsRepository(),
      child: BlocProvider(
        create: (context) =>
            CarsBloc(carsRepost: RepositoryProvider.of<CarsRepository>(context))
              ..add(GetCars()),
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: CarsScreen()),
      ),
    );
  }
}
