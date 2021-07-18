part of 'Services.dart';

class TransactionServices {
  static CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection("Transactions");

  static Future<void> storeTransaction(YoursUser user, Oxygen? oxygen,
      Medicine? medicine, bool isOxygen, String address, User? userId) async {
    await _transactionCollection.doc().set({
      'userId': userId!.uid,
      'item': isOxygen ? oxygen!.size : medicine!.packageName,
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'price': isOxygen ? oxygen!.price : medicine!.price,
      'address': address
    });
  }

  static Future<YoursTransaction> getTransactions(String userId) async {
    QuerySnapshot result =
        await _transactionCollection.where('userId', isEqualTo: userId).get();
    YoursTransaction transaction = YoursTransaction(
        userId: userId,
        item: (result as dynamic)['item'],
        name: (result as dynamic)['name'],
        email: (result as dynamic)['email'],
        phone: (result as dynamic)['phone'],
        price: (result as dynamic)['price'],
        address: (result as dynamic)['address']);
    return transaction;
  }
}
