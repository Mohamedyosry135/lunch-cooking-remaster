part of 'login_widgets_imports.dart';
class SocialMediaLogin extends StatelessWidget {
  final LoginData loginData;
  const SocialMediaLogin({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () =>loginData.userLoginWithGoogle(context),
          icon: Image.asset(
            Res.mailIcon,
          ),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () =>loginData.userLoginWithFacebook(context),
          icon: Image.asset(
            Res.faceIcon,
          ),
          iconSize: 40,
        ),
      ],
    );
  }
}
