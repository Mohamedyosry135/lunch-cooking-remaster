part of 'register_widgets_imports.dart';
class BuildLoginButton extends StatelessWidget {
  const BuildLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: "Already have an account!",
          color: MyColors.black,
          size: 14,
        ),
        const SizedBox(width: 5,),
        InkWell(
          onTap: () =>
              Get.back(),//AutoRouter.of(context).push(const LoginRoute()),
          child: MyText(
            title: "Login",
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
