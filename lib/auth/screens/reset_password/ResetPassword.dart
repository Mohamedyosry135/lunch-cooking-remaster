part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
   String? code;
   String? email;


  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordData resetPasswordData = ResetPasswordData();
  void initState() {
    // TODO: implement initState
    var args = Get.rootDelegate.arguments();

    widget.email = args[0]['email'];
    widget.code = args[0]['code'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showBackButton: true,
      child: Column(
        children: [
          BuildText(),
          BuildFormInputs(resetPasswordData: resetPasswordData,email: widget.email!,code: widget.code!),
          BuildButton(resetPasswordData: resetPasswordData,email: widget.email!,code: widget.code!),
        ],
      ),
    );
  }
}
