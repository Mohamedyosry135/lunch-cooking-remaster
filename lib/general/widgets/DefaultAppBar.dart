import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/my_colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size;

  DefaultAppBar(
      {required this.title, this.actions = const [], this.leading, this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
        title: "$title",
        size: 12,
        color: MyColors.black,
      ),
      centerTitle: false,
      backgroundColor: MyColors.white,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: MyColors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
