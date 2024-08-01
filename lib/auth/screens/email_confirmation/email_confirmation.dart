part of 'email_confirmation_imports.dart';
class EmailConfirmation extends StatefulWidget {
   String? email;

  // const EmailConfirmation({required this.email});

  @override
  _EmailConfirmationState createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  EmailConfirmationData emailConfirmationData=EmailConfirmationData();
   void initState() {
    // TODO: implement initState
    var args = Get.rootDelegate.arguments();

    widget.email = args[0]['email'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showBackButton: true,
      child: Column(
        children: [
          BuildText(userName: widget.email!),
          BuildFormInputs(emailConfirmationData: emailConfirmationData),
          BuildButtonList(emailConfirmationData: emailConfirmationData,email: widget.email!),
        ],
      ),
    );
  }
}
