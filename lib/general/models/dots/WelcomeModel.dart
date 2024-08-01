import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

class WelcomeModel {
  final String? image;
  final String? desc;
  final BuildContext? context;

  final bool last;
  final int? index;

  WelcomeModel({
    this.image,
    this.desc,
    this.last = false,
    this.index,
    this.context,
  });

  List<WelcomeModel> get data => [
        WelcomeModel(
          desc: "Choose The Ingredients",
          image: Res.intro_one,
          index: 0,
        ),
        WelcomeModel(
          desc: "Cook Your Recipe",
          image: Res.intro_two,
          index: 1,
        ),
        WelcomeModel(
          desc: "Enjoy Your Meal",
          image: Res.intro_three,
          index: 2,
          last: true
        ),
      ];
}
