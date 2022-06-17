import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/ui/layout1/constants/colors.dart';

class Inputfield extends StatelessWidget {
  TextEditingController? controller;
  bool obsecure;
  String name;
  IconData prefixicon;
  Widget? suffixicon;
  String? Function(String?) validator;

  Inputfield(
      {Key? key,
      this.controller,
      required this.name,
      required this.prefixicon,
      required this.obsecure,
      required this.validator,
      this.suffixicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextFormField(
      style: TextStyle(fontFamily: "poppins", decoration: TextDecoration.none),
      controller: controller,
      obscureText: obsecure,
      validator: validator,
      decoration: InputDecoration(
          hoverColor: kPrimaryColor,
          icon: Icon(prefixicon),
          hintText: name,
          errorStyle: TextStyle(fontFamily: "poppins"),
          focusColor: kPrimaryColor,
          hintStyle: TextStyle(fontFamily: "poppins"),
          fillColor: kPrimaryColor,
          suffixIcon: suffixicon),
    );
  }
}
