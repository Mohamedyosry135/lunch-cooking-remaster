part of 'ResetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title:"Password Reset",
            size: 50,
            color: MyColors.primaryDark,
          ),
          SizedBox(height: 20),
          MyText(
            title: "Enter your new password.",
            size: 18,
            color: MyColors.grey,
          ),
        ],
      ),
    );
  }
}
