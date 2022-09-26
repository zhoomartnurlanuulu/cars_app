part of 'cars_bloc.dart';

@immutable
abstract class CarsEvent {}

class GetCars extends CarsEvent {}

class DelateCars extends CarsEvent {}

class SearchCars extends CarsEvent {
  final String txt;

  SearchCars(this.txt);
}

class CarsSort extends CarsEvent {
  final Filters sort;
  CarsSort(this.sort);
}

class AddCars extends CarsEvent {
  final CarModel car;
  AddCars(this.car);
}

enum Filters{
  byYear,
  byName,
  byPrice
}