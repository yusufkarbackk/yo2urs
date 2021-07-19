part of 'Services.dart';

class AuthServices {
  static FirebaseAuth mAuth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await mAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      return SignInSignUpResult(message: null, user: user);
    } catch (e) {
      return SignInSignUpResult(
          user: null, message: e.toString().split(']')[1]);
    }
  }

  static Future<SignInSignUpResult> signUp(
      String name, String email, int? phone, String password) async {
    try {
      UserCredential result = await mAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      YoursUser user = YoursUser(
          id: result.user!.uid, name: name, email: email, phone: phone);

      await UserServices.storeUser(user);

      return SignInSignUpResult(user: result.user, message: null);
    } catch (e) {
      return SignInSignUpResult(
          message: e.toString().split(']')[1], user: null);
    }
  }

  static Future<void> signOut(context) async {
    User? firebaseUser = mAuth.currentUser;

    if (firebaseUser != null) {
      FirebaseAuth.instance.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomScreen()),
                (route) => false)
          });
    }
  }
}

class SignInSignUpResult {
  final User? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}
