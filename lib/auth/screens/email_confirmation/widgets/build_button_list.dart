part of 'email_confirmation_widgets_imports.dart';

class BuildButtonList extends StatelessWidget {
  final EmailConfirmationData emailConfirmationData;
  final String email;

  const BuildButtonList({
    required this.emailConfirmationData,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: emailConfirmationData.btnKey,
          title: "Next",
          fontSize: 14,
          onTap: () => emailConfirmationData.onActiveAccount(context, email),
          gradient: MyColors.gradient,
          textColor: MyColors.white,
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title: "Didn't get the confirmation code? ",
              size: 14,
              color: MyColors.grey,
            ),
            InkWell(
              onTap: () => emailConfirmationData.onResendCode(context, email),
              child: MyText(
                  title: "Resend Email",
                  size: 14,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ],
    );
  }
}
