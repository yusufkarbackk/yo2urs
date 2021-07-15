part of 'Screens.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: 200,
            height: 150,
            child: Text("Yo2rs"),
          ),
          Container(
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Text("Sign Up"),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
