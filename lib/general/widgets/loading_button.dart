import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingButton extends StatelessWidget {
  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final String? fontFamily;
  final Gradient? gradient;

  LoadingButton({
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    required this.btnKey,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? WidgetUtils.primaryColor;
    return Container(
      margin:
      margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius??25)
      ),
      child: Column(
        children: [
          CustomButtonAnimation(
            key: btnKey,
            onTap: onTap,
            width: width ?? MediaQuery.of(context).size.width,
            minWidth: 45,
            height: 45,
            color: gradient == null
                ? color ?? WidgetUtils.primaryColor
                : Colors.transparent,
            borderRadius: borderRadius ?? 25,
            borderSide: BorderSide(color: gradient == null
                ? borderColor ?? border
                : Colors.transparent, width: 1),
            child: MyText(
              title: "$title",
              size: fontSize??18,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
              fontFamily: fontFamily,
            ),
            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
