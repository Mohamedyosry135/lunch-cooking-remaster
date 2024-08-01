part of 'active_account_imports.dart';

class ActiveAccountData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController code = TextEditingController();

  void onActiveAccount(
      BuildContext context, String email, String userName, String pass) async {
    if (formKey.currentState!.validate()) {
      if (code.text.length < 6) {
        CustomToast.showSimpleToast(
            msg: 'Sorry, confirmation code not completed');
        return;
      }
      btnKey.currentState!.animateForward();
      // await AuthRepository(context).confirmUser(userName, pass, code.text);
      var data = await AuthRepository(context)
          .confirmSignup(email, code.text, userName, pass);
      if (data) {
        AuthRepository(context).signInUser(email, pass);
      }
      btnKey.currentState!.animateReverse();
    }
  }

  void onResendCode(BuildContext context, String email) async {
    LoadingDialog.showLoadingDialog();
    // await AuthRepository(context).resendSignUpCode(email);
    await AuthRepository(context).resendSignup(email);
    EasyLoading.dismiss();
  }
}
