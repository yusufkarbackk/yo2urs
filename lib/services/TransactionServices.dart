part of 'Services.dart';

class TransactionServices {
  static CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection("Transactions");

  static Future<StoreTransactionResult> storeTransaction(
      YoursTransaction transaction) async {
    try {
      await _transactionCollection.add({
        'userId': transaction.userId,
        'item': transaction.item,
        'name': transaction.name,
        'email': transaction.email,
        'phone': transaction.phone,
        'price': transaction.price,
        'address': transaction.address,
        'isOxygen': transaction.isOxygen
      });

      return StoreTransactionResult(message: null);
    } catch (e) {
      return StoreTransactionResult(message: e.toString());
    }
  }

  static Stream<QuerySnapshot> getTransactions(String userId) {
    Stream<QuerySnapshot> result =
        _transactionCollection.where('userId', isEqualTo: userId).snapshots();

    return result;
  }
}

class StoreTransactionResult {
  final String? message;

  StoreTransactionResult({this.message});
}
