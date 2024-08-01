import 'dart:ui';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/my_colors.dart';
import 'drawer_icon.dart';

class GeneralScaffold extends StatelessWidget {
  final Widget scaffoldBody;
  final String? title;
  final Widget? bottomAppBar;
  final Widget? floatingActionButton;
  final Widget? leading;
  final List<Widget> actions;

  GeneralScaffold({
    required this.scaffoldBody,
     this.title,
    this.actions = const [],
    this.bottomAppBar,
    this.leading,
    this.floatingActionButton,
  });

  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: MyColors.bg,
        key: scaffold,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: leading??DrawerIcon(
            onTap: () => scaffold.currentState!.openDrawer(),
          ),
          actions: actions,
        ),
        drawer: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Drawer(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 70,
                      child: IconButton(
                          icon: Icon(Icons.close,
                              size: 30, color: MyColors.primaryDark),
                          onPressed: () => Navigator.pop(context)),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: MyColors.kashmirLight,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10)),
                          ),
                          child: MyText(
                              title: "Hello, Abeer!",
                              color: MyColors.primaryDark,
                              size: 22),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 70, right: 50),
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10)),
                          ),
                          child: ListView(
                            children: List.generate(
                              4,
                              (index) => Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    title: MyText(
                                        title: "To-Buy List",
                                        size: 16,
                                        color: MyColors.black),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Divider(
                                    color: MyColors.kashmirLight,
                                    endIndent: 10,
                                    indent: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title!=null)Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MyText(
                title: title!,
                size: 36,
                color: MyColors.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: bottomAppBar),
            Expanded(
              child: scaffoldBody,
            ),
          ],
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      ),
    );
  }
}
