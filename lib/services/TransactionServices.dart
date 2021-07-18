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
        'address': transaction.address
      });

      return StoreTransactionResult(message: null);
    } catch (e) {
      return StoreTransactionResult(message: e.toString());
    }
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

class StoreTransactionResult {
  final String? message;

  StoreTransactionResult({this.message});
}
