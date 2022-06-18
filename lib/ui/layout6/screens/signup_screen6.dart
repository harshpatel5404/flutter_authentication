import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/ui/layout6/constants/colors.dart';
import 'package:flutter_authentication/ui/layout6/screens/login_screen6.dart';
import 'package:flutter_authentication/ui/layout6/widgets/input_field.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignupScreen6 extends StatefulWidget {
  const SignupScreen6({Key? key}) : super(key: key);

  @override
  State<SignupScreen6> createState() => _SignupScreen6State();
}

class _SignupScreen6State extends State<SignupScreen6> {
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
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.width * 0.5,
                    width: size.width * 0.5,
                    child: Image.asset("assets/layout1/signup.png"),
                  ),
                  Text(
                    "Let\'s Create An Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                      suffixicon: SizedBox()),
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
                          print(namecontroller.text);
                          print(passcontroller.text);
                        }
                      },
                      child: Text(
                        "Sign Up",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SigninScreen6()));
                          },
                          child: Text(
                            'Login',
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
