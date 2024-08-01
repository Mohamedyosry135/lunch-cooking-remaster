part of 'ForgetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildButton({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: forgerPasswordData.btnKey,
      title: "Continue",
      fontSize: 14,
      onTap: () => forgerPasswordData.onForgetPassword(context),
      gradient: MyColors.gradient,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    );
  }
}
