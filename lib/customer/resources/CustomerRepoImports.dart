

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/categorized_ingredient_model.dart';
import 'package:base_flutter/general/blocks/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:dio_helper/http/GenericHttp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio_helper/ModaLs/LoadingDialog.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio_helper/ModaLs/LoadingDialog.dart';


part 'CustomerHttpMethods.dart';
part 'CustomerRepository.dart';