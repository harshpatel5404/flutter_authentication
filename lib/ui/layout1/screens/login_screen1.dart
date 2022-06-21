import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/auth/auth_services.dart';
import 'package:flutterauthentication/ui/layout1/constants/colors.dart';
import 'package:flutterauthentication/ui/layout1/widgets/input_filed.dart';
import 'signup_screen1.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool isEmail(String input) => EmailValidator.validate(input);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Form(
              key: _formKey,
              child: Theme(
                data: ThemeData(
                  primaryColor: kPrimaryColor,
                  primarySwatch: colorCustom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.width * 0.6,
                      width: size.width * 0.6,
                      child: Image.asset("assets/layout1/signup.png"),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Inputfield(
                      prefixicon: Icons.email,
                      name: 'Enter your email',
                      validator: (email) {
                        if (isEmail(email!)) {
                          return null;
                        } else {
                          return 'Enter valid email address';
                        }
                      },
                      obsecure: false,
                      controller: emailcontroller,
                      suffixicon: SizedBox(),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Inputfield(
                      prefixicon: Icons.lock,
                      name: 'Enter your password',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obsecure: isVisible ? false : true,
                      controller: passcontroller,
                      suffixicon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: isVisible
                            ? const Icon(
                                Icons.visibility,
                                color: kPrimaryColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: kPrimaryColor,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SizedBox(
                      width: size.width * 0.85,
                      height: size.height * 0.07,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: Colors.white,
                          backgroundColor: kPrimaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(emailcontroller.text);
                            print(passcontroller.text);
                             AuthenticationService.signInWithEmail(emailcontroller.text,passcontroller.text)
                            .then((value) => print(value));
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ? '),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen1()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
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
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            print("press");
                            AuthenticationService.signInWithGoogle()
                                .then((value) => print(value));
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/google1.png",
                              height: size.height * 0.05,
                            ),
                          ),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            AuthenticationService.signInWithFacebook()
                                .then((value) => print(value));
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: Image.asset(
                            "assets/icons/facebook1.png",
                            height: size.height * 0.07,
                          ),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                              AuthenticationService.signInWithApple()
                                .then((value) => print(value));
                          },
                          elevation: 2.0,
                          fillColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/apple1.png",
                              color: Colors.white,
                              height: size.height * 0.05,
                            ),
                          ),
                          shape: CircleBorder(),
                        ),
                        const SizedBox(
                          width: 1,
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
