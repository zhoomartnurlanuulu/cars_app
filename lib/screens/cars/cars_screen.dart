import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2/models/car_model.dart';
import 'package:task2/screens/car_add/caradd_screen.dart';
import 'package:task2/screens/routes/cars_route.dart';

import '../../bloc/cars_bloc.dart';

part 'widgets/car_item.dart';
part 'widgets/appbar.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, FadeRoute(page: const CarAdding()));
          },
          child: const Icon(Icons.add),
        ),
        appBar: _AppBar(),
        body: BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state is CarsLoadState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CarsSucessState) {
              return ListView.separated(
                itemCount: state.cars.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: ((context, index) => _CarItem(
                      name: state.cars[index],
                    )),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
              );
            }
            return const Center(child: Text('Nothing to load'));
          },
        ));
  }
}
