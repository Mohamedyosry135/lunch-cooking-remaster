part of 'ForgetPasswordImports.dart';

class ForgerPasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();
  final TextEditingController email = new TextEditingController();


  void onForgetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await AuthRepository(context).resetPassword(email.text);
      btnKey.currentState!.animateReverse();
    }
  }
}
