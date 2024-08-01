part of 'login_widgets_imports.dart';
class LoginButton extends StatelessWidget {
  final LoginData loginData;
  const LoginButton({Key? key,required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingButton(
        btnKey: loginData.btnKey,
        title: "Login",
        fontSize: 14,
        onTap: () => loginData.userLogin(context),
        gradient: MyColors.gradient,
        textColor: MyColors.white,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
    );
    // return DefaultButton(
    //   margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //   gradient: MyColors.gradient,
    //   title: "Login",
    //   onTap: () {},
    // );
  }
}
