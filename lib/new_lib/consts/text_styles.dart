import 'package:base_flutter/new_lib/consts/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle  textXLarge = TextStyle(
      fontSize: 25.sp,
      color: const Color(ColorCode.black),
      fontWeight: FontWeight.w800,
      fontFamily: "DIN Arabic Light");
  static TextStyle textLarge = TextStyle(
      fontSize: 22.sp,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w700,
      height: 1.0454545454545454,
      fontFamily: "DIN Arabic Light");
  static const  textMedium = TextStyle(
      fontSize: 16,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontFamily: "DIN Arabic Light");
  static TextStyle textSmall = TextStyle(
      fontSize: 13.sp,
      height: 1,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w700,
      fontFamily: "DIN Arabic Light");
  static TextStyle  textXSmall = TextStyle(
      fontSize: 11.sp,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w600,
      fontFamily: "DIN Arabic Light");

  static TextStyle bottomNavBarItemStyle =
      TextStyle(fontFamily: "DIN Arabic Light", height: 1, fontSize: 13.sp);
}
