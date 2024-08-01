part of 'email_confirmation_imports.dart';
class EmailConfirmationData{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController code = TextEditingController();

  void onActiveAccount(
      BuildContext context, String email) async {
    if (formKey.currentState!.validate()) {
      if (code.text.length < 6) {
        CustomToast.showSimpleToast(
            msg: 'Sorry, confirmation code not completed');
        return;
      }
      // AutoRouter.of(context).push(ResetPasswordRoute(code: code.text,email: email));
     Get.rootDelegate.toNamed(Routes.RESET_PASSWORD,arguments: [
        {"email":email},
       {"code":code.text}

     ]);
    }
  }

  void onResendCode(BuildContext context, String email) async {
    LoadingDialog.showLoadingDialog();
    // await AuthRepository(context).resendSignUpCode(email);
    await AuthRepository(context).resendSignup(email);
    EasyLoading.dismiss();
  }
}