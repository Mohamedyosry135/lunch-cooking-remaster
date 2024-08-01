part of 'login_imports.dart';

class LoginData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GenericBloc<bool> showPassword = GenericBloc(true);

  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var email = Utils.convertDigitsToLatin(userNameController.text);
      var pass = Utils.convertDigitsToLatin(passwordController.text);
      await AuthRepository(context).signInUser(email, pass);
      btnKey.currentState!.animateReverse();
    }
  }

  void userLoginWithGoogle(BuildContext context) async {
    await AuthRepository(context).signInWithSocialWebUI(AuthProvider.google);
  }

  void userLoginWithFacebook(BuildContext context) async {
    await AuthRepository(context).signInWithSocialWebUI(AuthProvider.facebook);
  }
}
