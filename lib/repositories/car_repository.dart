import '../models/car_model.dart';

class CarsRepository {
  List<CarModel> getCars() {
    return _cars;
  }
}

final _cars = [
  CarModel(
      volume: 3.5,
      name: 'Mercedes-Benz',
      model: 'E-Class',
      years: 2012,
      url:
          'https://avatars.mds.yandex.net/get-autoru-vos/2130267/9931bc98545dc558a86cc68153b49664/456x342n',
      price: 15000),
  CarModel(
      volume: 2.4,
      name: 'Honda',
      model: 'CR-V',
      years: 2015,
      url:
          'https://cdn.riastatic.com/photosnewr/auto/photo/honda-cr-v__292191619-460x345.jpg',
      price: 25000),
  CarModel(
      volume: 3.0,
      name: 'Subaru',
      model: 'Outback',
      years: 2003,
      url: 'https://i.ytimg.com/vi/tDBB9wwD11g/maxresdefault.jpg',
      price: 8500),
  CarModel(
      volume: 4.8,
      name: 'Audi',
      model: 'A8',
      years: 2010,
      url:
          'https://avatars.mds.yandex.net/get-autoru-vos/6024412/4d67ff8deac56edb4318c4983d85e505/456x342n',
      price: 18550)
];
