import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/auth/auth_services.dart';
import 'package:flutterauthentication/ui/layout2/Widgets/button2.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  late TextEditingController emailcontroller;
  late TextEditingController passcontroller;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController(text: '');
    passcontroller = TextEditingController(text: '');
  }

  bool remember = false;
  final List<String?> errors = [];
  bool isEmail(String input) => EmailValidator.validate(input);
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 40),
          DefaultButton2(
            text: "Login",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                AuthenticationService.signInWithEmail(
                        emailcontroller.text, passcontroller.text)
                    .then((value) => print(value));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passcontroller,
      obscureText: isvisible ? false : true,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (value.length < 8) {
          return "Minimum Required Length 8";
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 5.0),
          ),
          hintText: "Enter your password",
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 2.0),
          ),
          focusColor: kPrimaryColor,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isvisible = !isvisible;
                });
              },
              child: Icon(
                isvisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: kPrimaryColor,
              )),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: kPrimaryColor,
            size: 25,
          ),
          prefixIconColor: kPrimaryColor),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailcontroller,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Email";
        } else if (!isEmail(emailcontroller.text)) {
          return 'Enter a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 5.0),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 2.0),
          ),
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: kPrimaryColor,
            size: 25,
          ),
          prefixIconColor: kPrimaryColor),
    );
  }
}
