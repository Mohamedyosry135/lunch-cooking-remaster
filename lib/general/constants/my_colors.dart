import 'dart:ui';
import 'package:flutter/material.dart';

class MyColors {
  static Color primary = Color(0xff7C409C);
  static Color primaryLight = Color(0xffE7ADF7);
  static Color primaryDark = Color(0xff321542);
  static Color kashmir = Color(0xffC08CAA);
  static Color kashmirLight = Color(0xffE5CEDB);
  static Color alertDialogBg = Color(0xff9D6BAD);
  static Color secondary = Color(0xff2A4571);
  static Color headerColor = Color(0xff6e7c87);
  static Color bg = Color(0xffFCFCFC);
  static Color bgTF = Color(0xffF9F9F9);
  static Color offWhite = Color(0xffF2F2F2);
  static Color gold = Color(0xffe4aa69);
  static Color grey = Color(0xff757575);
  static Color greyWhite = Color(0xffE4E4E4);
  static Color black = Color(0xff031626);
  static Color blackOpacity = Colors.black54;
  static Color white = Colors.white;
  static Color notifyColor = Colors.black54;

  static Gradient gradient =
      LinearGradient(colors: [primaryLight, kashmir, primary]);
}
