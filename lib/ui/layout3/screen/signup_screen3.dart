import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';
import 'package:flutterauthentication/ui/layout3/screen/login_screen3.dart';
import 'package:flutterauthentication/ui/layout3/widgets/button3.dart';
import 'package:flutterauthentication/ui/layout3/widgets/textformfield3.dart';

import '../../../auth/auth_services.dart';

class SignupScreen3 extends StatefulWidget {
  const SignupScreen3({Key? key}) : super(key: key);

  @override
  State<SignupScreen3> createState() => _SignupScreen3State();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();
TextEditingController confpasscontroller = TextEditingController();
bool isEmail(String input) => EmailValidator.validate(input);

class _SignupScreen3State extends State<SignupScreen3> {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 4,
              ),
              Image.asset(
                "assets/layout3/logo.png",
                height: height * 0.15,
                color: Colors.white,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormfield3(
                          obsecure: false,
                          emailcontroller: namecontroller,
                          hintText: "ENTER NAME",
                          icon: Icon(
                            Icons.person,
                            color: kPrimaryColor3,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "PLEASE ENTER NAME";
                            }
                          },
                        ),
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
                        TextFormfield3(
                          emailcontroller: confpasscontroller,
                          obsecure: true,
                          hintText: "ENTER CONFIRM PASSWORD",
                          icon: Icon(
                            Icons.lock_outline,
                            color: kPrimaryColor3,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "PLEASE ENTER CONFIRM PASSWORD";
                            } else if (val.length < 8) {
                              return "MINIMUM REQUIRED LENGTH IS 8";
                            } else if (confpasscontroller.text !=
                                passcontroller.text) {
                              return "CONFIRM PASSWORD NOT MATCH";
                            }
                          },
                        ),
                        DefaultButton3(
                          text: "SIGNUP",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              AuthenticationService.createUserwithEmail(
                                      emailcontroller.text, passcontroller.text)
                                  .then((value) {
                                print(value);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen3()));
                              });
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have An Account ?",
                                style: TextStyle(color: Colors.white)),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen3()));
                                },
                                child: Text(" LOGIN",
                                    style: TextStyle(color: kPrimaryColor3))),
                          ],
                        ),
                      ],
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
            InkWell(
              onTap: () {
                AuthenticationService.signInWithGoogle()
                    .then((value) => print(value));
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/google1.png",
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
            ),
            VerticalDivider(
              color: Colors.white38,
              indent: 10,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                AuthenticationService.signInWithFacebook()
                    .then((value) => print(value));
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/facebook1.png",
                    height: height * 0.05,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
