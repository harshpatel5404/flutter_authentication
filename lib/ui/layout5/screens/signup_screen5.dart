import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout5/constants/colors.dart';
import 'package:flutterauthentication/ui/layout5/screens/login_screen5.dart';
import 'package:flutterauthentication/ui/layout5/widgets/input_field.dart';

import '../../../auth/auth_services.dart';

class SignupScreen5 extends StatefulWidget {
  const SignupScreen5({Key? key}) : super(key: key);

  @override
  State<SignupScreen5> createState() => _SignupScreen5State();
}

class _SignupScreen5State extends State<SignupScreen5> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: size.height,
            color: Colors.amber,
          ),
          Form(
            key: _formKey,
            child: Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                height: size.height * 0.73,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Inputfield(
                          prefixicon: Icons.person,
                          name: 'Enter your name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            } else {
                              return null;
                            }
                          },
                          obsecure: false,
                          controller: namecontroller,
                          suffixicon: SizedBox(),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Inputfield(
                          prefixicon: Icons.email,
                          name: 'yourmail@gmail.com',
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
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
                          height: size.height * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: size.width * 0.8,
                          height: size.height * 0.07,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.white,
                              backgroundColor: kPrimaryColor,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // print(emailcontroller.text);
                                // print(namecontroller.text);
                                // print(passcontroller.text);
                                AuthenticationService.createUserwithEmail(
                                        emailcontroller.text,
                                        passcontroller.text)
                                    .then((value) {
                                  print(value);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignInScreen5()));
                                });
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  AuthenticationService.signInWithGoogle()
                                      .then((value) => print(value));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: size.width * 0.12,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF3F3F3),
                                  ),
                                  child: Image.asset(
                                    "assets/icons/google1.png",
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AuthenticationService.signInWithFacebook()
                                      .then((value) => print(value));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: size.width * 0.12,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF3F3F3),
                                  ),
                                  child: Image.asset(
                                    "assets/icons/facebook1.png",
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AuthenticationService.signInWithApple()
                                      .then((value) => print(value));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: size.width * 0.12,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF3F3F3),
                                  ),
                                  child: Image.asset(
                                    "assets/icons/apple1.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignInScreen5()));
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
