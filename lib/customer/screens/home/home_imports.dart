import 'dart:ui';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/ingredient_model.dart';
import 'package:base_flutter/general/blocks/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/default_button.dart';
import 'package:base_flutter/general/widgets/drawer_icon.dart';
import 'package:base_flutter/general/widgets/general_alert_dialog.dart';
import 'package:base_flutter/general/widgets/general_scaffold.dart';
import 'package:base_flutter/general/widgets/generic_text_field.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:base_flutter/general/widgets/validator.dart';
import 'package:base_flutter/new_lib/routes/app_pages.dart';
import 'package:base_flutter/res.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';


part 'home.dart';
part 'home_data.dart';