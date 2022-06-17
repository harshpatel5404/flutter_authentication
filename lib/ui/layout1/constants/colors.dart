import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff00008B);
// const kPrimaryLightColor = Color(0xFFd9ffd9);
Map<int, Color> color = {
      50: Color.fromRGBO(0, 0, 139, .1),
      100: Color.fromRGBO(0, 0, 139, .2),
      200: Color.fromRGBO(0, 0, 139, .3),
      300: Color.fromRGBO(0, 0, 139, .4),
      400: Color.fromRGBO(0, 0, 139, .5),
      500: Color.fromRGBO(0, 0, 139, .6),
      600: Color.fromRGBO(0, 0, 139, .7),
      700: Color.fromRGBO(0, 0, 139, .8),
      800: Color.fromRGBO(0, 0, 139, .9),
      900: Color.fromRGBO(0, 0, 139, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xff00008B, color);
