import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout6/constants/colors.dart';
import 'package:flutterauthentication/ui/layout6/screens/signup_screen6.dart';
import 'package:flutterauthentication/ui/layout6/widgets/input_field.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SigninScreen6 extends StatefulWidget {
  const SigninScreen6({Key? key}) : super(key: key);

  @override
  State<SigninScreen6> createState() => _SigninScreen6State();
}

class _SigninScreen6State extends State<SigninScreen6> {
  final _formKey = GlobalKey<FormState>();
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
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: size.width * 0.5,
                    width: size.width * 0.5,
                    child: Image.asset("assets/layout1/signup.png"),
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    width: size.width * 0.85,
                    height: size.height * 0.07,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print(emailcontroller.text);
                          print(passcontroller.text);
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
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
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.width * 0.14,
                    child: SignInButton(
                      Buttons.Google,
                      mini: false,
                      padding: EdgeInsets.all(6),
                      text: "Sign up with Google",
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.width * 0.14,
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Sign up facebook",
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have any account? ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen6()));
                          },
                          child: Text(
                            'Create New',
                            style: TextStyle(
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
    );
  }
}
