import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';
import 'package:flutterauthentication/ui/layout4/constants/colors.dart';

class TextFormfield4 extends StatelessWidget {
  const TextFormfield4({
    Key? key,
    this.hintText,
    this.validator,
    this.textcontroller,
    this.icon,
    this.obsecure,
  }) : super(key: key);
  final String? hintText;
  final bool? obsecure;
  final String? Function(String?)? validator;
  final Widget? icon;
  final TextEditingController? textcontroller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(primaryColor: kPrimaryColor4),
      child: TextFormField(
        controller: textcontroller,
        obscureText: obsecure!,
        cursorColor: kPrimaryColor4,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor4),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            focusColor: kPrimaryColor3,
            hoverColor: kPrimaryColor3,
            hintText: hintText,
            contentPadding: EdgeInsets.all(16),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: icon,
            suffixIconColor: kPrimaryColor4),
      ),
    );
  }
}
