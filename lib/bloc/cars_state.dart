// ignore_for_file: overridden_fields

part of 'cars_bloc.dart';

@immutable
abstract class CarsState {
  final List<CarModel> cars;

  const CarsState(this.cars);
}

class CarsInitialState extends CarsState {
  @override
  final List<CarModel> cars;

  const CarsInitialState(this.cars) : super(cars);
}

class CarsLoadState extends CarsState {
  @override
  final List<CarModel> cars;

  const CarsLoadState(this.cars) : super(cars);
}

class CarsErrorState extends CarsState {
  @override
  final List<CarModel> cars;

  const CarsErrorState(this.cars) : super(cars);
}

class CarsSucessState extends CarsState {
  @override
  final List<CarModel> cars;

  const CarsSucessState(this.cars) : super(cars);
}
