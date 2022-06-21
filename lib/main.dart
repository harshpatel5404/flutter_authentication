import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout1/constants/colors.dart';
import 'package:flutterauthentication/ui/layout1/screens/login_screen1.dart';
import 'package:flutterauthentication/ui/layout1/screens/signup_screen1.dart';
import 'package:flutterauthentication/ui/layout6/screens/signup_screen6.dart';
import 'ui/layout5/screens/signup_screen5.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: const LoginScreen1());
  }
}
