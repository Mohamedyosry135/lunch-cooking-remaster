part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgerPasswordData forgerPasswordData = new ForgerPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showBackButton: true,
      child: Column(
        children: [
          BuildText(),
          BuildFormInputs(forgerPasswordData: forgerPasswordData),
          BuildButton(forgerPasswordData: forgerPasswordData),
          RegisterButton(),
        ],
      ),
    );
  }
}
