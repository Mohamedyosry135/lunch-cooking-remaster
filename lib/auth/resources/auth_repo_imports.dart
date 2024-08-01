
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/blocks/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/new_lib/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio_helper/ModaLs/LoadingDialog.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;
import 'package:shared_preferences/shared_preferences.dart';


part 'auth_http_methods.dart';
part 'auth_repository.dart';