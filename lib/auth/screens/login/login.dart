part of 'login_imports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginData loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        AutoRouter.of(context).push(SplashRoute());
        return true;
      },
      child: AuthScaffold(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(title: "Login", color: MyColors.primaryDark, size: 50),
                  const SizedBox(height: 40),
                  MyText(
                      title: "Login to your account",
                      color: MyColors.grey,
                      size: 18),
                  SocialMediaLogin(loginData: loginData),
                  LoginFormFields(loginData: loginData),
                  const ForgetPasswordView(),
                ],
              ),
            ),
            LoginButton(loginData: loginData),
            const RegisterButton(),
            const GuestButton(),
          ],
        ),
      ),
    );
  }
}
