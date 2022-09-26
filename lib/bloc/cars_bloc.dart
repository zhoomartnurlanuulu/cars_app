// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task2/models/car_model.dart';
import 'package:task2/repositories/car_repository.dart';
import 'package:stream_transform/stream_transform.dart';
part 'cars_event.dart';
part 'cars_state.dart';

EventTransformer<E> _restartableDebounce<E>() {
  return (events, mapper) =>
      events.debounce(const Duration(milliseconds: 400)).switchMap(mapper);
}

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc({required this.carsRepost}) : super(const CarsInitialState([])) {
    on<GetCars>((event, emit) async {
      emit(CarsLoadState(state.cars));
      await Future.delayed(const Duration(seconds: 1));
      final cars = carsRepost.getCars();
      allCars = cars;
      emit(CarsSucessState(cars));
    });

    on<SearchCars>(
      (event, emit) async {
        emit(const CarsLoadState([]));
        await Future.delayed(const Duration(seconds: 0));
        final newCar = allCars.where((a) {
          final CarsName = "${a.name}${a.model}";
          return CarsName.toLowerCase().contains(event.txt.toLowerCase());
        }).toList();
        emit(CarsSucessState(newCar));
      },
      transformer: _restartableDebounce(),
    );

    on<AddCars>((event, emit) async {
      emit(CarsLoadState(state.cars));
      await Future.delayed(const Duration(seconds: 2));
      allCars.add(event.car);
      emit(CarsSucessState(allCars));
    });
    on<CarsSort>((event, emit) async {
      emit(CarsLoadState(state.cars));
      switch (event.sort) {
        case Filters.byYear:
          allCars.sort((a, b) => a.years.compareTo(b.years));
          break;
        case Filters.byPrice:
          allCars.sort((a, b) => a.price.compareTo(b.price));
          break;
        case Filters.byName:
          allCars.sort((a, b) => a.name.compareTo(b.name));
          break;
      }

      await Future.delayed(const Duration(seconds: 1));
      emit(CarsSucessState(allCars));
    });
  }
  @override
  void onTransition(Transition<CarsEvent, CarsState> transition) {
    super.onTransition(transition);
  }

  final CarsRepository carsRepost;
  List<CarModel> allCars = [];
}
