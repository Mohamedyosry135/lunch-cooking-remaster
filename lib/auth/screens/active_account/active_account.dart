part of 'active_account_imports.dart';

class ActiveAccount extends StatefulWidget {
   String? email;
   String? userName;
   String? password;

      // {required this.userName, required this.password, required this.email});

  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  ActiveAccountData activeAccountData = new ActiveAccountData();
  @override
  void initState() {
    // TODO: implement initState
    var args = Get.rootDelegate.arguments();

    widget.email = args[0]['email'];
    widget.userName = args[0]['userName'];
    widget.password = args[0]['password'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return AuthScaffold(
      showBackButton: true,
      child: Column(
        children: [
          BuildText(userName: widget.email!),
          BuildFormInputs(activeAccountData: activeAccountData),
          BuildButtonList(
            activeAccountData: activeAccountData,
            userName: widget.userName!,
            email: widget.email!,
            password: widget.password!,
          ),
        ],
      ),
    );
  }
}
