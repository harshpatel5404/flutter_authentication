import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout1/constants/colors.dart';
import 'package:flutterauthentication/ui/layout1/screens/login_screen1.dart';
import 'package:flutterauthentication/ui/layout1/widgets/input_filed.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({Key? key}) : super(key: key);

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
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
                        "Sign Up",
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
                      height: size.height * 0.02,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'By Signin up, you are agree to our '),
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
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
                              borderRadius: BorderRadius.circular(20)),
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
                            fontFamily: "poppins",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Joined us before ? '),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen1()));
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
