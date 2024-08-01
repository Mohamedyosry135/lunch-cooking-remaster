part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();

  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();
  final GenericBloc<bool> showPassword = GenericBloc(true);
  final GenericBloc<bool> showConfirmPassword = GenericBloc(true);
  final GenericBloc<String> passValidationCubit = GenericBloc("0");
  final GenericBloc<bool> visibilityCubit = GenericBloc(false);

  void onResetPassword(BuildContext context, String email,String code) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await AuthRepository(context).confirmResetPassword(email,newPassword.text,code);
      btnKey.currentState!.animateReverse();
    }
  }



  void checkDisable() {
    if (formKey.currentState!.validate() &&
        passValidationCubit.state.data == "1") {
      visibilityCubit.onUpdateData(true);
    } else {
      visibilityCubit.onUpdateData(false);
    }
  }
}
