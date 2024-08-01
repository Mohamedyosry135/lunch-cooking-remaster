part of 'register_imports.dart';

class RegisterData {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  final GenericBloc<bool> showPassword = GenericBloc(true);
  final GenericBloc<bool> showConfirmPassword = GenericBloc(true);
  final GenericBloc<bool> termsCubit = GenericBloc(false);
  final GenericBloc<bool> visibilityCubit = GenericBloc(false);
  final GenericBloc<String> passValidationCubit = GenericBloc("0");

  void userRegister(BuildContext context) async {
    print("======>userRegister");
    FocusScope.of(context).requestFocus(FocusNode());
    if (termsCubit.state.data == false) {
      return CustomToast.showSimpleToast(msg: "Must accept terms");
    }
    btnKey.currentState!.animateForward();
    var email = Utils.convertDigitsToLatin(emailController.text);
    var pass = Utils.convertDigitsToLatin(passwordController.text);
    // await AuthRepository(context).signUpUser(email, pass);
    await AuthRepository(context).signup(email, pass);
    btnKey.currentState!.animateReverse();
  }

  void checkDisable() {
    if (formKey.currentState!.validate() &&
        passValidationCubit.state.data == "1") {
      // if (termsCubit.state.data == false) {
      //   visibilityCubit.onUpdateData(false);
      // }
      visibilityCubit.onUpdateData(true);
    } else {
      visibilityCubit.onUpdateData(false);
    }
  }
}
