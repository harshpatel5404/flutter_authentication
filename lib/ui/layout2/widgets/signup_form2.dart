import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout2/Widgets/button2.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool ispassvisible = false;
  bool iscopassvisible = false;

  String? name;
  String? conform_password;
  bool isEmail(String input) => EmailValidator.validate(input);

  late TextEditingController emailcontroller;
  late TextEditingController passcontroller;
  late TextEditingController namecontroller;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController(text: '');
    namecontroller = TextEditingController(text: '');
    passcontroller = TextEditingController(text: '');
  }

  bool remember = false;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: 30),
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 30),
          buildConformPassFormField(),
          SizedBox(height: 40),
          DefaultButton2(
            text: "Sign Up",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // createUserwithEmail(namecontroller.text, emailcontroller.text,
                //         phonecontroller.text, passcontroller.text)
                //     .then((value) {
                //   if (value == "Email already exists") {
                // scafoldmessage(context, value);
                //   } else {
                // scafoldmessage(context, "Sign Up Successfully..!");

                //   }
                //   print(value);
                // });
                // if all are valid then go to success screen
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: namecontroller,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Name";
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusColor: kPrimaryColor,
        contentPadding: EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 2.0),
        ),
        hintText: "Enter your first name",
        hintStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.person,
          color: kPrimaryColor,
          size: 25,
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: iscopassvisible ? false : true,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => conform_password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Confirm Email";
        } else if ((password != value)) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 5.0),
          ),
          hintText: "Confirm password",
          contentPadding: EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 2.0),
          ),
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  iscopassvisible = !iscopassvisible;
                });
              },
              child: Icon(
                iscopassvisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: kPrimaryColor,
              )),
          focusColor: kPrimaryColor,
          hintStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: kPrimaryColor,
            size: 25,
          ),
          prefixIconColor: kPrimaryColor),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passcontroller,
      obscureText: ispassvisible ? false : true,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (value.length < 8) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 5.0),
          ),
          hintText: "Enter your password",
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 2.0),
          ),
          focusColor: kPrimaryColor,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  ispassvisible = !ispassvisible;
                });
              },
              child: Icon(
                ispassvisible
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
          contentPadding: EdgeInsets.all(16),
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
