
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/category_model.dart';
import 'package:base_flutter/customer/models/ingredient_model.dart';
import 'package:base_flutter/customer/screens/show_all_ingredients/widget/show_all_ingredients_widgets_imports.dart';
import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/general/data_base/database_helper.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/widgets/default_button.dart';
import 'package:base_flutter/general/widgets/general_scaffold.dart';
import 'package:base_flutter/general/widgets/generic_text_field.dart';
import 'package:base_flutter/general/widgets/validator.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

import '../../../general/widgets/my_text.dart';

part 'show_all_ingredients.dart';
part 'show_all_ingredients_data.dart';