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
        backgroundColor: kPrussanBlue,
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 250,
                          //NOTE: ADD LOGO
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: kLemonmeringue,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      //NOTE: WHITE CONTAINER
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 18),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    isEmailValid =
                                        EmailValidator.validate(text);
                                  });
                                },
                                obscureText: false,
                                controller: emailController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    errorStyle:
                                        TextStyle(color: Colors.redAccent),
                                    errorText: isEmailValid
                                        ? null
                                        : "Please fill the Email",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kPrussanBlue, width: 2)),
                                    hintText: "Enter your email",
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 18),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    isPasswordValid = text.length >= 6;
                                  });
                                },
                                obscureText: true,
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    errorStyle:
                                        TextStyle(color: Colors.redAccent),
                                    errorText: isPasswordValid
                                        ? null
                                        : "Please fill the password (minimum 6 characters)",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kPrussanBlue, width: 2)),
                                    hintText: "Enter your password",
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                            ),
                            Container(
                              child: isLogin
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SpinKitFadingCircle(
                                        color: kPrussanBlue,
                                        size: 50,
                                      ),
                                    )
                                  : Container(
                                      width: 70,
                                      height: 70,
                                      child: Center(
                                        child: FloatingActionButton(
                                          backgroundColor: kDarkRed,
                                          onPressed: () async {
                                            //NOTE: AUTH LOGIC
                                            setState(() {
                                              isLogin = true;
                                            });
                                            if (emailController.text.length ==
                                                    0 &&
                                                passwordController
                                                        .text.length ==
                                                    0) {
                                              setState(() {
                                                isLogin = false;
                                              });
                                              Flushbar(
                                                duration: Duration(seconds: 3),
                                                flushbarPosition:
                                                    FlushbarPosition.TOP,
                                                backgroundColor:
                                                    Color(0xFFFF5C83),
                                                message:
                                                    "Please fill all the fields",
                                              )..show(context);
                                            } else {
                                              SignInSignUpResult result =
                                                  await AuthServices.signIn(
                                                      emailController.text,
                                                      passwordController.text);
                                              if (result.message != null) {
                                                Flushbar(
                                                  duration:
                                                      Duration(seconds: 2),
                                                  flushbarPosition:
                                                      FlushbarPosition.TOP,
                                                  backgroundColor:
                                                      Color(0xFFFF5C83),
                                                  message: result.message,
                                                )..show(context);
                                                setState(() {
                                                  isLogin = false;
                                                });
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen()));
                                              }
                                            }
                                          },
                                          child: Center(
                                            child: FaIcon(
                                                FontAwesomeIcons.arrowRight),
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
