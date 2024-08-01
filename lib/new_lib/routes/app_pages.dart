
import 'package:base_flutter/auth/screens/active_account/active_account_imports.dart';
import 'package:base_flutter/auth/screens/email_confirmation/email_confirmation_imports.dart';
import 'package:base_flutter/auth/screens/forget_password/ForgetPasswordImports.dart';
import 'package:base_flutter/auth/screens/login/login_imports.dart';
import 'package:base_flutter/auth/screens/register/register_imports.dart';
import 'package:base_flutter/auth/screens/reset_password/ResetPasswordImports.dart';
import 'package:base_flutter/customer/screens/filter/filter_imports.dart';
import 'package:base_flutter/customer/screens/home/home_imports.dart';
import 'package:base_flutter/customer/screens/ingredients/ingredients_widgets.dart';
import 'package:base_flutter/general/screens/on_boarding/on_boarding_page_imports.dart';
import 'package:base_flutter/general/screens/splash/splash_imports.dart';
import 'package:base_flutter/general/screens/terms/terms_imports.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () =>  Splash(),
        // binding: SplashBinding()
    ),
    GetPage(
      name: Routes.ON_BOARDING_PAGE_ROUTE,
      page: () => OnBoardingPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => Register(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => ForgetPassword(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.TERMS,
      page: () => Terms(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ACTIVE_ACCOUNT,
      page: () => ActiveAccount(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.EMAIL_CONFIRMATION,
      page: () => EmailConfirmation(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPassword(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FILTER,
      page: () => Filter(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.INGREDIENTS,
      page: () => Ingredients(),
      // binding: LoginBinding(),
    ),
  ];
}
