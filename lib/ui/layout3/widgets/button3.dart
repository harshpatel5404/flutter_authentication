import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';

class DefaultButton3 extends StatelessWidget {
  const DefaultButton3({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: double.infinity,
      width: width * 0.55,
      height: height * 0.07,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor3,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
