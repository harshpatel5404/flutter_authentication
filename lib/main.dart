import 'package:flutter/material.dart';
import 'package:flutter_authentication/ui/layout1/constants/colors.dart';
import 'package:flutter_authentication/ui/layout1/screens/login_screen1.dart';
import 'package:flutter_authentication/ui/layout1/screens/signup_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Authentication',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const SignupScreen1());
  }
}
