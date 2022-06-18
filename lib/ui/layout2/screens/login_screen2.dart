import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout2/Widgets/login_form2.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';
import 'package:flutterauthentication/ui/layout2/screens/signup_screen2.dart';

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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
