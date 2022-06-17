import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/ui/layout5/constants/colors.dart';

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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(
            fontFamily: "poppins",
            decoration: TextDecoration.none,
            fontSize: 13,
            fontWeight: FontWeight.w500),
        controller: controller,
        obscureText: obsecure,
        validator: validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            hoverColor: kPrimaryColor,
            hintText: name,
            errorStyle: TextStyle(fontFamily: "poppins"),
            focusColor: kPrimaryColor,
            hintStyle: TextStyle(
              fontFamily: "poppins",
            ),
            fillColor: kPrimaryColor,
            suffixIcon: suffixicon),
      ),
    );
  }
}
