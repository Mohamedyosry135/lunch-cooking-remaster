part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const ON_BOARDING_PAGE_ROUTE = '/OnBoardingPageRoute';
  static const HOME = '/Home';
  static const INGREDIENTS = '/Ingredients';
  static const FORGET_PASSWORD = '/ForgetPassword';
  static const REGISTER = '/Register';
  static const TERMS = '/Terms';
  static const ACTIVE_ACCOUNT = '/ActiveAccount';
  static const EMAIL_CONFIRMATION = '/EmailConfirmation';
  static const RESET_PASSWORD = '/ResetPassword';
  static const FILTER = '/Filter';

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
