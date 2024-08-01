part of 'ResetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String code;
  final String email;

  const BuildButton({required this.resetPasswordData,required this.code,required this.email});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: resetPasswordData.btnKey,
      title: "Continue",
      fontSize: 14,
      onTap: () => resetPasswordData.onResetPassword(context, email, code),
      gradient: MyColors.gradient,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    );
  }
}
