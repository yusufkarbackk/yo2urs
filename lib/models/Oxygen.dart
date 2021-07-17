part of 'Models.dart';

class Oxygen {
  final String size;
  final int price;

  Oxygen({required this.size, required this.price});
}

List<Oxygen> oxygens = [
  Oxygen(size: '500 cc', price: 70000),
  Oxygen(size: '1 m3', price: 800000),
  Oxygen(size: '1,5 m3', price: 2000000),
  Oxygen(size: '2 m3', price: 2200000),
];
