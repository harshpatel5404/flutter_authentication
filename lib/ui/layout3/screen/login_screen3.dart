import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';
import 'package:flutterauthentication/ui/layout3/screen/signup_screen3.dart';
import 'package:flutterauthentication/ui/layout3/widgets/button3.dart';
import 'package:flutterauthentication/ui/layout3/widgets/textformfield3.dart';

class LoginScreen3 extends StatefulWidget {
  const LoginScreen3({Key? key}) : super(key: key);
  @override
  State<LoginScreen3> createState() => _LoginScreen3State();
}

bool isEmail(String input) => EmailValidator.validate(input);

TextEditingController emailcontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();

class _LoginScreen3State extends State<LoginScreen3> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/layout3/logo.png",
                height: height * 0.15,
                color: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormfield3(
                            obsecure: false,
                            emailcontroller: emailcontroller,
                            hintText: "ENTER EMAIL",
                            icon: Icon(
                              Icons.email_outlined,
                              color: kPrimaryColor3,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "PLEASE ENTER EMAIL";
                              } else if (!isEmail(emailcontroller.text)) {
                                return "ENTER VALID EMAIL ADDRESS";
                              }
                            },
                          ),
                          TextFormfield3(
                            obsecure: true,
                            emailcontroller: passcontroller,
                            hintText: "ENTER PASSWORD",
                            icon: Icon(
                              Icons.lock_outline,
                              color: kPrimaryColor3,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "PLEASE ENTER PASSWORD";
                              } else if (val.length < 8) {
                                return "MINIMUM REQUIRED LENGTH IS 8";
                              }
                            },
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Fogot Password?",
                                style: TextStyle(
                                    color: kPrimaryColor3, fontSize: 12),
                              )),
                          DefaultButton3(
                            text: "LOGIN",
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't Have An Account ?",
                                  style: TextStyle(color: Colors.white)),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen3()));
                                  },
                                  child: Text(" SIGN UP",
                                      style: TextStyle(color: kPrimaryColor3))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * 0.09,
        decoration: BoxDecoration(
          color: Color(0xff1A2027),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/layout3/google.png",
                  height: height * 0.04,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Google",
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                )
              ],
            ),
            VerticalDivider(
              color: Colors.white38,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/layout3/apple.png",
                  height: height * 0.05,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Apple",
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
