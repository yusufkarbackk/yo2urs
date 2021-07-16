part of 'Services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("Yours User");

  static Future<void> storeUser(YoursUser user) async {
    _userCollection.doc(user.id).set({
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "phone": user.phone
    });
  }

  static Future<YoursUser> getUser(String id) async {
    DocumentSnapshot result = await _userCollection.doc(id).get();

    return YoursUser(
        id: id,
        name: (result.data() as dynamic)['name'],
        email: (result.data() as dynamic)['email'],
        phone: (result.data() as dynamic)['phone']);
  }
}
