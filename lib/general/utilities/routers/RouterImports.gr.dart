// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i16;
import 'package:base_flutter/auth/screens/active_account/active_account_imports.dart'
    as _i7;
import 'package:base_flutter/auth/screens/email_confirmation/email_confirmation_imports.dart'
    as _i6;
import 'package:base_flutter/auth/screens/forget_password/ForgetPasswordImports.dart'
    as _i8;
import 'package:base_flutter/auth/screens/login/login_imports.dart' as _i9;
import 'package:base_flutter/auth/screens/register/register_imports.dart'
    as _i10;
import 'package:base_flutter/auth/screens/reset_password/ResetPasswordImports.dart'
    as _i11;
import 'package:base_flutter/customer/models/category_model.dart' as _i18;
import 'package:base_flutter/customer/screens/filter/filter_imports.dart'
    as _i14;
import 'package:base_flutter/customer/screens/home/home_imports.dart' as _i12;
import 'package:base_flutter/customer/screens/ingredients/ingredients_widgets.dart'
    as _i13;
import 'package:base_flutter/customer/screens/show_all_ingredients/show_all_ingredients_imports.dart'
    as _i15;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i4;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i3;
import 'package:base_flutter/general/screens/on_boarding/on_boarding_page_imports.dart'
    as _i5;
import 'package:base_flutter/general/screens/splash/splash_imports.dart' as _i1;
import 'package:base_flutter/general/screens/terms/terms_imports.dart' as _i2;
import 'package:flutter/material.dart' as _i17;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.Splash());
    },
    TermsRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.Terms());
    },
    ConfirmPasswordRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.ConfirmPassword());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.ChangePassword());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.OnBoardingPage());
    },
    EmailConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<EmailConfirmationRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.EmailConfirmation());
    },
    ActiveAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveAccountRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.ActiveAccount());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.ForgetPassword());
    },
    LoginRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.Login());
    },
    RegisterRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.Register());
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.ResetPassword());
    },
    HomeRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.Home());
    },
    IngredientsRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.Ingredients());
    },
    FilterRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.Filter());
    },
    ShowAllIngredientsRoute.name: (routeData) {
      final args = routeData.argsAs<ShowAllIngredientsRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.ShowAllIngredients(
              key: args.key, categoryModel: args.categoryModel));
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(SplashRoute.name, path: '/'),
        _i16.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i16.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i16.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i16.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i16.RouteConfig(EmailConfirmationRoute.name,
            path: '/email-confirmation'),
        _i16.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i16.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i16.RouteConfig(LoginRoute.name, path: '/Login'),
        _i16.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i16.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i16.RouteConfig(HomeRoute.name, path: '/Home'),
        _i16.RouteConfig(IngredientsRoute.name, path: '/Ingredients'),
        _i16.RouteConfig(FilterRoute.name, path: '/Filter'),
        _i16.RouteConfig(ShowAllIngredientsRoute.name,
            path: '/show-all-ingredients')
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Terms]
class TermsRoute extends _i16.PageRouteInfo<void> {
  const TermsRoute() : super(TermsRoute.name, path: '/Terms');

  static const String name = 'TermsRoute';
}

/// generated route for
/// [_i3.ConfirmPassword]
class ConfirmPasswordRoute extends _i16.PageRouteInfo<void> {
  const ConfirmPasswordRoute()
      : super(ConfirmPasswordRoute.name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

/// generated route for
/// [_i4.ChangePassword]
class ChangePasswordRoute extends _i16.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i5.OnBoardingPage]
class OnBoardingPageRoute extends _i16.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(OnBoardingPageRoute.name, path: '/on-boarding-page');

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i6.EmailConfirmation]
class EmailConfirmationRoute
    extends _i16.PageRouteInfo<EmailConfirmationRouteArgs> {
  EmailConfirmationRoute()
      : super(EmailConfirmationRoute.name,
            path: '/email-confirmation',
            // args: EmailConfirmationRouteArgs(email: email)
  );

  static const String name = 'EmailConfirmationRoute';
}

class EmailConfirmationRouteArgs {

   String? email;

  @override
  String toString() {
    return 'EmailConfirmationRouteArgs{email: $email}';
  }
}

/// generated route for
/// [_i7.ActiveAccount]
class ActiveAccountRoute extends _i16.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute()
      : super(ActiveAccountRoute.name,
            path: '/active-account',
            args: ActiveAccountRouteArgs());

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
   ActiveAccountRouteArgs();

   String? userName;

   String? password;

   String? email;

  @override
  String toString() {
    return 'ActiveAccountRouteArgs{userName: $userName, password: $password, email: $email}';
  }
}

/// generated route for
/// [_i8.ForgetPassword]
class ForgetPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i9.Login]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i10.Register]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/Register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i11.ResetPassword]
class ResetPasswordRoute extends _i16.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({required String code, required String email})
      : super(ResetPasswordRoute.name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(code: code, email: email));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.code, required this.email});

  final String code;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{code: $code, email: $email}';
  }
}

/// generated route for
/// [_i12.Home]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/Home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.Ingredients]
class IngredientsRoute extends _i16.PageRouteInfo<void> {
  const IngredientsRoute() : super(IngredientsRoute.name, path: '/Ingredients');

  static const String name = 'IngredientsRoute';
}

/// generated route for
/// [_i14.Filter]
class FilterRoute extends _i16.PageRouteInfo<void> {
  const FilterRoute() : super(FilterRoute.name, path: '/Filter');

  static const String name = 'FilterRoute';
}

/// generated route for
/// [_i15.ShowAllIngredients]
class ShowAllIngredientsRoute
    extends _i16.PageRouteInfo<ShowAllIngredientsRouteArgs> {
  ShowAllIngredientsRoute(
      {_i17.Key? key, required _i18.CategoryModel categoryModel})
      : super(ShowAllIngredientsRoute.name,
            path: '/show-all-ingredients',
            args: ShowAllIngredientsRouteArgs(
                key: key, categoryModel: categoryModel));

  static const String name = 'ShowAllIngredientsRoute';
}

class ShowAllIngredientsRouteArgs {
  const ShowAllIngredientsRouteArgs({this.key, required this.categoryModel});

  final _i17.Key? key;

  final _i18.CategoryModel categoryModel;

  @override
  String toString() {
    return 'ShowAllIngredientsRouteArgs{key: $key, categoryModel: $categoryModel}';
  }
}
