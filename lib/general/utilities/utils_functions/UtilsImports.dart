import 'dart:convert';
import 'dart:io';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputDecoration.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputTextStyle.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/new_lib/routes/app_pages.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utils.dart';

