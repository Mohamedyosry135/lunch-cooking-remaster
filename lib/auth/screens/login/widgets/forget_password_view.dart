part of 'login_widgets_imports.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: ()=> Get.rootDelegate.toNamed(Routes.FORGET_PASSWORD),//AutoRouter.of(context).push(const ForgetPasswordRoute()),
        child: MyText(
          title: "Forgot your password?",
          color: MyColors.black,
          size: 14,
          decoration: TextDecoration.underline,
          alien: TextAlign.end,
        ),
      ),
    );
  }
}
