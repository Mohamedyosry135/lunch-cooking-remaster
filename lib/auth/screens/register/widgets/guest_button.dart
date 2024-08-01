part of 'register_widgets_imports.dart';
class GuestButton extends StatelessWidget {
  const GuestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultButton(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 110,
        color: MyColors.white,
        borderColor: MyColors.greyWhite,
        textColor: MyColors.kashmir,
        fontWeight: FontWeight.normal,
        title: "Guest",
        fontSize: 20,
        onTap: () {},
      ),
    );
  }
}
