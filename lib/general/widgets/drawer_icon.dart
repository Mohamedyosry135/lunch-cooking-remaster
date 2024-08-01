import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  final Function() onTap;
   DrawerIcon({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3,
            width: 27,
            decoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            height: 3,
            width: 20,
            decoration: BoxDecoration(
              color: MyColors.kashmir,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          Container(
            height: 3,
            width: 27,
            decoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
        ],
      ),
    );
  }
}
