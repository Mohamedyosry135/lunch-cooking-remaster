part of 'ForgetPasswordWidgetsImports.dart';
class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: "You Don't Have an Account?",
          color: MyColors.black,
          size: 14,
        ),
        const SizedBox(width: 5,),
        InkWell(
          onTap: () =>
              Get.rootDelegate.offNamed(Routes.REGISTER),//AutoRouter.of(context).push(const RegisterRoute()),
          child: MyText(
            title: "Sign Up",
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
            size: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
