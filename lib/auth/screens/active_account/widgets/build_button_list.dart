part of 'active_account_widgets_imports.dart';

class BuildButtonList extends StatelessWidget {
  final ActiveAccountData activeAccountData;
  final String email;
  final String userName;
  final String password;

  const BuildButtonList({
    required this.activeAccountData,
    required this.email,
    required this.userName,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: activeAccountData.btnKey,
          title: "Next",
          fontSize: 14,
          onTap: () => activeAccountData.onActiveAccount(context, email,userName,password),
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
              onTap: () => activeAccountData.onResendCode(context, email),
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
