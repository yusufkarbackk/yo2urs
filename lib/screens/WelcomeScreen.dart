part of 'Screens.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrussanBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              child: Text("Yo2rs",
                  style: kMainText.copyWith(color: Colors.white, fontSize: 36)),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent, fixedSize: Size(300, 45)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Center(
                      child: Text(
                        "Login",
                        style: kSeccondText.copyWith(color: Colors.white),
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: kLemonmeringue, fixedSize: Size(300, 45)),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: kSeccondText.copyWith(color: Colors.black),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
