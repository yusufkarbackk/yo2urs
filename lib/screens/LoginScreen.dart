part of 'Screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = false;
  late bool isEmailValid;
  late bool isPasswordValid;

  @override
  void initState() {
    super.initState();
    isEmailValid = true;
    isPasswordValid = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 150,
              //NOTE: ADD LOGO
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent),
                        errorText:
                            isEmailValid ? null : "Please fill the email",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrussanBlue, width: 2)),
                        hintText: "Enter your email",
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent),
                        errorText: isPasswordValid
                            ? null
                            : "Please fill the password (minimum 6 characters)",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrussanBlue, width: 2)),
                        hintText: "Enter your password",
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  )
                ],
              ),
            ),
            Center(
              child: isLogin
                  ? SpinKitFadingCircle(
                      color: kPrussanBlue,
                      size: 50,
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        backgroundColor: kPrussanBlue,
                        onPressed: () async {
                          setState(() {
                            isLogin = true;
                          });
                          if (emailController.text.length == 0 &&
                              passwordController.text.length == 0) {
                            setState(() {
                              isLogin = false;
                            });
                            Flushbar(
                              duration: Duration(seconds: 3),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Please fill all the fields",
                            )..show(context);
                          } else {
                            SignInSignUpResult result =
                                await AuthServices.signIn(emailController.text,
                                    passwordController.text);
                            if (result.message != null) {
                              Flushbar(
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: result.message,
                              )..show(context);
                              setState(() {
                                isLogin = false;
                              });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          }
                        },
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.paw),
                        ),
                      )),
            )
          ],
        ),
      ),
    ));
  }
}
