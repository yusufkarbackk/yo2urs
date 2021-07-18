part of 'Models.dart';

class YoursTransaction {
  final String userId;
  final String item;
  final String name;
  final String email;
  final int? phone;
  final int price;
  final String address;

  YoursTransaction(
      {required this.userId,
      required this.item,
      required this.name,
      required this.email,
      required this.phone,
      required this.price,
      required this.address});
}
