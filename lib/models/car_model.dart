import 'dart:io';

class CarModel {
  final String name;
  final int years;
  final String model;
  final double price;
  final File? localImage;
  final String? url;
  final double volume;
  CarModel({
    this.localImage,
    required this.name,
     this.url,
    required this.model,
    required this.price,
    required this.volume,
    required this.years,
  });
}
