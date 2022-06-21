import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout2/Widgets/login_form2.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';
import 'package:flutterauthentication/ui/layout2/screens/signup_screen2.dart';

import '../../../auth/auth_services.dart';

class LoginScreen2 extends StatefulWidget {
  LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.05),
                Text(
                  "Login",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: height * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.03),
                LoginForm(),
                SizedBox(height: height * 0.02),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen2()),
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen2()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 14, color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  )),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    endIndent: 10,
                    indent: 10,
                  )),
                ]),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 1,
                    ),
                    InkWell(
                      onTap: () {
                        AuthenticationService.signInWithGoogle()
                            .then((value) => print(value));
                      },
                      child: Image.asset(
                        "assets/icons/google1.png",
                        height: height * 0.055,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AuthenticationService.signInWithFacebook()
                            .then((value) => print(value));
                      },
                      child: Image.asset(
                        "assets/icons/facebook1.png",
                        height: height * 0.055,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AuthenticationService.signInWithApple()
                            .then((value) => print(value));
                      },
                      child: Image.asset(
                        "assets/icons/apple1.png",
                        height: height * 0.055,
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    )
                    // Image.asset("assets/layout1/google.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
