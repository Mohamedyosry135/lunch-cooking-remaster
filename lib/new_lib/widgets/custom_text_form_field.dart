import 'package:base_flutter/new_lib/consts/colors.dart';
import 'package:base_flutter/new_lib/consts/text_styles.dart';
import 'package:base_flutter/new_lib/resources/assets_svg_generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final String label;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.inputType,
      required this.label,
        this.onChange,
        this.nextFocus,
      this.validator,
      this.controller,
      this.obscureText = false,
      this.decoration,
        this.focusNode,
      this.maxLines = 1,
      this.isHiddenPassword = false,
      this.obscuringCharacter = " ",
      this.inputFormatters,
      this.onTapShowHidePassword,
        this.textInputAction,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
      cursorColor: const Color(ColorCode.darkGray),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      focusNode: focusNode,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
        textInputAction: textInputAction,
      onFieldSubmitted: nextFocus,
      style: TextStyles.textMedium.copyWith(
        color: const Color(ColorCode.black),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      decoration: decoration ??
          InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.textMedium.copyWith(
              color: const Color(ColorCode.black).withOpacity(.5),
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            labelText: label,
            labelStyle: TextStyles.textMedium.copyWith(
              color: const Color(ColorCode.darkGray).withOpacity(.6),
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Color(0xff808080).withOpacity(.2), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Color(0xff808080).withOpacity(.2), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Color(0xff808080).withOpacity(.2), width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Color(0xff808080).withOpacity(.2), width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14).r,
            prefixIcon: prefixIcon,
            suffixIcon: obscureText
                ? GestureDetector(
                    onTap: onTapShowHidePassword,
                    child: isHiddenPassword
                        ? const Icon(
                            Icons.visibility_off,
                            size: 24,
                            color: Color(0xff808080),
                          )
                        : null)//AppSVGAssets.getWidget(AppSVGAssets.showPassword))
                : suffixIcon,
          ),
    );
  }
}
