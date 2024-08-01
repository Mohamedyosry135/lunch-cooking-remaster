part of 'active_account_widgets_imports.dart';

class BuildText extends StatelessWidget {
  final String userName;

  const BuildText({Key? key, required this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title:"Email Confirmation",
            size: 45,
            color: MyColors.primaryDark,
          ),
          SizedBox(height: 40),
          MyText(
            title: "Please type the confirmation code sent to $userName",
            size: 18,
            color: MyColors.grey,
          ),
        ],
      ),
    );
  }
}
