import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterauthentication/ui/layout4/constants/colors.dart';
import 'package:flutterauthentication/ui/layout4/widgets/button4.dart';
import 'package:flutterauthentication/ui/layout4/widgets/textformfield4.dart';

class SignupScreen4 extends StatefulWidget {
  const SignupScreen4({Key? key}) : super(key: key);

  @override
  State<SignupScreen4> createState() => _SignupScreen4State();
}

class _SignupScreen4State extends State<SignupScreen4>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  late final TabController _tabController =
      TabController(vsync: this, length: 2);

  bool isEmail(String input) => EmailValidator.validate(input);
  bool issignup = true;
  TextEditingController loginpasscontroller = TextEditingController();
  TextEditingController loginemailcontroller = TextEditingController();

  TextEditingController signnamecontroller = TextEditingController();
  TextEditingController signemailcontroller = TextEditingController();
  TextEditingController signpasscontroller = TextEditingController();
  Icon visiicon = Icon(Icons.visibility);
  bool loginisVisible = false;
  bool signupisVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: height,
        child: Stack(
          // overflow: Overflow.visible,
          children: [
            Container(
                width: width,
                child: Positioned(
                    top: 0, child: Image.asset("assets/layout4/back.jpg"))),
            Positioned(
              top: height * 0.28,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(width * 0.07),
                child: Container(
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10.0,
                            spreadRadius: 2),
                      ]),
                  child: DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.08,
                            child: TabBar(
                              labelColor: kPrimaryColor4,
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle:
                                  TextStyle(color: Colors.grey),
                              indicatorColor: kPrimaryColor4,
                              indicatorSize: TabBarIndicatorSize.label,
                              controller: _tabController,
                              tabs: const [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.4,
                            child: TabBarView(
                                controller: _tabController,
                                physics: const ScrollPhysics(),
                                children: [
                                  Form(
                                    key: _formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextFormfield4(
                                            icon: SizedBox(),
                                            obsecure: false,
                                            textcontroller: signnamecontroller,
                                            hintText: "ENTER NAME",
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please Enter Name";
                                              }
                                            },
                                          ),
                                          TextFormfield4(
                                            icon: SizedBox(),
                                            obsecure: false,
                                            textcontroller: signemailcontroller,
                                            hintText: "ENTER EMAIL",
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please Enter Email";
                                              } else if (!isEmail(
                                                  signemailcontroller.text)) {
                                                return "Enter Valid Email";
                                              }
                                            },
                                          ),
                                          TextFormfield4(
                                            textcontroller: signpasscontroller,
                                            obsecure:
                                                signupisVisible ? false : true,
                                            hintText: "ENTER PASSWORD",
                                            icon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  signupisVisible
                                                      ? signupisVisible = false
                                                      : signupisVisible = true;
                                                });
                                              },
                                              child: signupisVisible
                                                  ? const Icon(
                                                      Icons.visibility,
                                                      color: kPrimaryColor4,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility_off,
                                                      color: kPrimaryColor4,
                                                    ),
                                            ),
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please Enter Password";
                                              } else if (val.length < 8) {
                                                return "Password Is Too Short";
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          DefaultButton4(
                                            text: "Sign Up",
                                            press: () {
                                              print("click");
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                              }
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Already have an account ? ",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _tabController.index = 1;
                                                },
                                                child: const Text(
                                                  "Sign In",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kPrimaryColor4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextFormfield4(
                                            icon: SizedBox(),
                                            obsecure: false,
                                            textcontroller: signemailcontroller,
                                            hintText: "ENTER EMAIL",
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please Enter Email";
                                              } else if (!isEmail(
                                                  signemailcontroller.text)) {
                                                return "Enter Valid Email";
                                              }
                                            },
                                          ),
                                          TextFormfield4(
                                            obsecure:
                                                loginisVisible ? false : true,
                                            textcontroller:
                                                loginemailcontroller,
                                            hintText: "ENTER PASSWORD",
                                            icon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  loginisVisible =
                                                      !loginisVisible;
                                                });
                                              },
                                              child: loginisVisible
                                                  ? const Icon(
                                                      Icons.visibility,
                                                      color: kPrimaryColor4,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility_off,
                                                      color: kPrimaryColor4,
                                                    ),
                                            ),
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Please Enter Password";
                                              } else if (val.length < 8) {
                                                return "Password Is Too Short";
                                              }
                                            },
                                          ),
                                          DefaultButton4(
                                            text: "Sign in",
                                            press: () {
                                              print("click");

                                              if (_formKey2.currentState!
                                                  .validate()) {
                                                _formKey2.currentState!.save();
                                              }
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Already have an account ? ",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _tabController.index = 0;
                                                },
                                                child: Text(
                                                  "Sign Up",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: kPrimaryColor4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      endIndent: 10,
                      indent: width * 0.07,
                    )),
                    Text(
                      "OR",
                      style: TextStyle(
                          color: kPrimaryColor4,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      endIndent: width * 0.07,
                      indent: 10,
                    )),
                  ]),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: width * 0.12,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(0.2)),
                          child: Image.asset(
                            "assets/layout4/google1.png",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: width * 0.12,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(0.2)),
                          child: Image.asset(
                            "assets/layout4/apple1.png",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: width * 0.12,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(0.2)),
                          child: Image.asset(
                            "assets/layout4/facebook1.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
