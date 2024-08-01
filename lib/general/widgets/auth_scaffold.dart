import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final bool showBackButton;

  AuthScaffold({
    required this.child,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Res.bg), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: showBackButton?IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: MyColors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ):Container(),
            ),
            backgroundColor: Colors.transparent,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 86,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
