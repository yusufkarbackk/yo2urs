part of 'Screens.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    if (user == null) {
      return WelcomScreen();
    } else {
      return HomeScreen(
        id: user.uid,
      );
    }
  }
}
