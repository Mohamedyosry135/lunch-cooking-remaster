import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  MyText(
      {required this.title,
        required this.color,
        required this.size,
        this.alien,
        this.fontFamily,
        this.decoration,
        this.overflow,
        this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: alien ?? TextAlign.start,
      style: TextStyle(
          color: color??Colors.black,
          fontSize: size??16,
          decoration: decoration??TextDecoration.none,
          fontWeight: fontWeight??(WidgetUtils.lang=="ar"?FontWeight.w500:FontWeight.w200),
          fontFamily: fontFamily?? (WidgetUtils.lang=="ar"? GoogleFonts.cairo().fontFamily : "Proxima Nova")
      ),
      overflow: overflow,
    );
  }
}
