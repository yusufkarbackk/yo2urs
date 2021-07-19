part of 'Screens.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isLogin = false;
  late bool isEmailValid;
  late bool isPasswordValid;
  late bool isNameValid;
  late bool isPhoneValid;

  @override
  void initState() {
    super.initState();
    isEmailValid = true;
    isPasswordValid = true;
    isPhoneValid = true;
    isNameValid = true;
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrussanBlue,
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          //TODO: ADD LOGO
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AuthTextWidget(
                              obscure: false,
                              keyboardType: TextInputType.name,
                              errorText:
                                  isNameValid ? null : "please enter your name",
                              controller: nameController,
                              hintText: "Enter your name",
                              labelText: "Name",
                              onChanged: (text) {
                                setState(() {
                                  isNameValid = nameController.text.length > 0;
                                });
                              },
                            ),
                            AuthTextWidget(
                              obscure: false,
                              keyboardType: TextInputType.number,
                              errorText: isPhoneValid
                                  ? null
                                  : "please enter your phone number(12 characters)",
                              controller: phoneController,
                              hintText: "Enter your phone",
                              labelText: "Phone",
                              onChanged: (text) {
                                setState(() {
                                  isPhoneValid =
                                      phoneController.text.length == 12;
                                });
                              },
                            ),
                            AuthTextWidget(
                                obscure: false,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (text) {
                                  setState(() {
                                    isEmailValid =
                                        EmailValidator.validate(text ?? "");
                                  });
                                },
                                controller: emailController,
                                hintText: "Enter your email",
                                labelText: "Email",
                                errorText: isEmailValid
                                    ? null
                                    : "please enter your email"),
                            AuthTextWidget(
                                obscure: true,
                                onChanged: (text) {
                                  isPasswordValid =
                                      passwordController.text.length >= 6;
                                },
                                controller: passwordController,
                                hintText: "Enter your password",
                                labelText: "Password",
                                errorText: isPasswordValid
                                    ? null
                                    : "please enter your password"),
                            isLogin
                                ? SpinKitFadingCircle(
                                    color: kPrussanBlue,
                                    size: 50,
                                  )
                                : Container(
                                    width: 60,
                                    height: 60,
                                    child: FloatingActionButton(
                                      backgroundColor: kDarkRed,
                                      onPressed: () async {
                                        //NOTE: AUTH LOGIC
                                        setState(() {
                                          isLogin = true;
                                        });

                                        if (emailController.text.length == 0 &&
                                            passwordController.text.length ==
                                                0 &&
                                            nameController.text.length == 0 &&
                                            phoneController.text.length == 0) {
                                          setState(() {
                                            isLogin = false;
                                          });
                                          Flushbar(
                                            duration: Duration(seconds: 3),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message:
                                                "Please fill all the fields",
                                          )..show(context);
                                        } else {
                                          int? phoneNumber = int.tryParse(
                                              phoneController.text);
                                          SignInSignUpResult result =
                                              await AuthServices.signUp(
                                                  nameController.text,
                                                  emailController.text,
                                                  phoneNumber,
                                                  passwordController.text);
                                          if (result.message != null) {
                                            Flushbar(
                                              duration: Duration(seconds: 2),
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
                                                        HomeScreen(
                                                            id: user.uid)));
                                          }
                                        }
                                      },
                                      child: Center(
                                        child:
                                            FaIcon(FontAwesomeIcons.arrowRight),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
