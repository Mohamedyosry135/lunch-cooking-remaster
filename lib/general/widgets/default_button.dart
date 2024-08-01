import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final String? fontFamily;
  final Gradient? gradient;
  final FontWeight? fontWeight;

  DefaultButton({
    required this.title,
    this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.gradient,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? WidgetUtils.primaryColor;
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 45,
      margin: margin ?? EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius?? BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: MyText(
          title: "$title",
          size: fontSize ?? 18,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight??FontWeight.bold,
          fontFamily: fontFamily,
          alien: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
            primary: gradient == null
                ? color ?? WidgetUtils.primaryColor
                : Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                side: BorderSide(
                    color: gradient == null
                        ? borderColor ?? border
                        : Colors.transparent,
                    width: 1)),
            elevation: 0),
      ),
    );
  }
}
