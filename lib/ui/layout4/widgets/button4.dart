import 'package:flutter/material.dart';
import 'package:flutterauthentication/ui/layout2/constants/colors.dart';
import 'package:flutterauthentication/ui/layout3/constants/colors.dart';
import 'package:flutterauthentication/ui/layout4/constants/colors.dart';

class DefaultButton4 extends StatelessWidget {
  const DefaultButton4({
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
      width: width * 0.6,
      height: height * 0.065,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor4,
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
