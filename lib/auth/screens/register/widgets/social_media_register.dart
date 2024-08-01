part of 'register_widgets_imports.dart';
class SocialMediaRegister extends StatelessWidget {
  const SocialMediaRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Res.mailIcon,
          ),
          iconSize: 40,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Res.faceIcon,
          ),
          iconSize: 40,
        ),
      ],
    );
  }
}
