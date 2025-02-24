import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int? max;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final TextInputType type;
  final TextInputAction action;
  final BorderRadius? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTab;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Function(String? value) validate;
  final FieldTypes fieldTypes;
  final Function()? onSubmit;
  final Function(String)? onChange;

  GenericTextField(
      { this.label,
        this.hint,
        required this.fieldTypes,
        this.controller,
        this.margin,
        this.contentPadding,
        required this.type,
        this.onTab,
        this.radius,
        this.max,
        this.textColor,
        this.fillColor,
        this.hintColor,
        this.prefixIcon,
        this.suffixIcon,
        this.onChange,
        this.onSubmit,
        required this.action,
        this.enableBorderColor,
        this.focusBorderColor,
        required this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: InkWell(
        onTap: onTab,
        child: AbsorbPointer(
          absorbing: fieldTypes==FieldTypes.clickable,
          child: TextFormField(
            controller: controller,
            keyboardType: type ,
            textInputAction: action,
            enableSuggestions: false,
            autocorrect: false,
            enabled: fieldTypes!=FieldTypes.disable,
            autofillHints: getAutoFillHints(type),
            maxLines: fieldTypes==FieldTypes.chat? null: fieldTypes==FieldTypes.rich? max :1,
            obscureText: fieldTypes==FieldTypes.password,
            readOnly: fieldTypes==FieldTypes.readonly,
            onEditingComplete: onSubmit,
            onChanged: onChange,
            validator: (value) => validate(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: WidgetUtils.textStyle.copyWith(color: textColor??WidgetUtils.textStyle.color),
            decoration: WidgetUtils.setInputDecoration(
              label: label,
              hint: hint,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enableColor: enableBorderColor,
              focusBorderColor: focusBorderColor,
              fillColor: fillColor,
              padding: contentPadding,
              hintColor: hintColor,
              radius: radius,
            ),
          ),
        ),
      ),
    );
  }

  List<String> getAutoFillHints(TextInputType inputType){
    if(inputType==TextInputType.emailAddress){
      return [AutofillHints.email];
    } else if(inputType==TextInputType.datetime){
      return [AutofillHints.birthday];
    } else if(inputType==TextInputType.phone){
      return [AutofillHints.telephoneNumber];
    }else if(inputType==TextInputType.url){
      return [AutofillHints.url];
    }
    return [AutofillHints.name,AutofillHints.username];
  }

}

enum FieldTypes { normal, clickable, readonly, chat, password,rich,disable}
