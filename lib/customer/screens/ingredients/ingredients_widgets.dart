import 'dart:convert';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/category_model.dart';
import 'package:base_flutter/customer/models/ingredient_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepoImports.dart';
import 'package:base_flutter/customer/screens/home/home_imports.dart';
import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/general/data_base/database_helper.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/default_button.dart';
import 'package:base_flutter/general/widgets/general_scaffold.dart';
import 'package:base_flutter/general/widgets/generic_text_field.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:base_flutter/general/widgets/validator.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'widgets/ingredients_widgets_imports.dart';

part 'ingredients.dart';
part 'ingredients_data.dart';