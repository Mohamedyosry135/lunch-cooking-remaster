import 'package:flutter/material.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? validateEmpty(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context, "fillField");
    }
    return null;
  }

  String? validatePassword(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "fillField";//tr(context, "fillField");
    } else if (this.length < 8) {
      return message ?? "passValidation";//tr(context, "passValidation");
    }
    return null;
  }

  String? validateEmail(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "fillField";//tr(context, "fillField");
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? "fillField";//tr(context, "mailValidation");
    }
    return null;
  }

  String validateRegisterPassword(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return "0";
    } else if (!RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(this)) {
      return "2";
    }
    return "1";
  }

  String? validateEmailORNull(BuildContext context, {String? message}) {
    if (this.trim().isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? tr(context, "mailValidation");
      }
    }
    return null;
  }

  String? validatePhone(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "fillField";//tr(context, "fillField");
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(this) ||
        this.length < 10) {
      return message ?? tr(context, "phoneValidation");
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,
      {required String pass, String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "fillField";//tr(context, "fillField");
    } else if (this != pass) {
      return message ?? tr(context, "confirmValidation");
    }
    return null;
  }
}

extension ValidatorDrop<DataType> on DataType {
  String? validateDropDown(BuildContext context, {String? message}) {
    if (this == null) {
      return message ?? "fillField";//tr(context, "fillField");
    }
    return null;
  }
}
