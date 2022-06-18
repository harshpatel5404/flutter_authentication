import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';

class TextFormfield3 extends StatelessWidget {
  const TextFormfield3({
    Key? key,
    this.hintText,
    this.validator,
    this.emailcontroller,
    this.icon,
    this.obsecure,
  }) : super(key: key);
  final String? hintText;
  final String? Function(String?)? validator;
  final Icon? icon;
  final bool? obsecure;
  final TextEditingController? emailcontroller;

  @override
  Widget build(BuildContext context) {
    bool isEmail(String input) => EmailValidator.validate(input);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextFormField(
      controller: emailcontroller,
      cursorColor: kPrimaryColor3,
      obscureText: obsecure!,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      style: TextStyle(color: Colors.white),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 5.0,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 2.0, color: kPrimaryColor3),
          ),
          fillColor: Color(0xff1A2027),
          filled: true,
          focusColor: kPrimaryColor3,
          hoverColor: kPrimaryColor3,
          hintText: hintText,
          contentPadding: EdgeInsets.all(16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: icon,
          suffixIconColor: kPrimaryColor3),
    );
  }
}
