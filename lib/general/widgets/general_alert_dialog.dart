import 'package:base_flutter/general/constants/my_colors.dart';
import 'package:base_flutter/general/widgets/default_button.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
enum AlertButtonType { noButton, button, dueButton }
enum AlertTextType { fullTitle, title, noTitle }
enum AlertImageType { warning, success, noImg }

class GeneralAlertDialog extends StatelessWidget {
  final String? buttonTitle;
  final String? blueButtonTitle;
  final String? whiteButtonTitle;
  final String? subTitle;
  final bool? visibleWhiteButton;
  final double? marginHeadTitle;

  final String? headTitle;

  final AlertButtonType alertButtonType;

  final AlertTextType alertTextType;

  final AlertImageType alertImageType;

  final Function()? onTapBlueButton;
  final Function()? onTapWhiteButton;
  final Function()? onTapButton;

  const GeneralAlertDialog(
      {Key? key,
        this.visibleWhiteButton = true,
        this.onTapBlueButton,
        this.onTapWhiteButton,
        required this.alertButtonType,
        required this.alertTextType,
        required this.alertImageType,
        this.subTitle,
        this.headTitle,
        this.onTapButton,
        this.buttonTitle,
        this.blueButtonTitle,
        this.whiteButtonTitle,
        this.marginHeadTitle = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: alertImageType == AlertImageType.success,
              child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 0),
                  child: Image.asset(
                    Res.chec,
                    scale: 3,
                  )),
              replacement: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    Res.warning,
                    scale: 3,
                  )),
            ),
            Visibility(
              visible: alertTextType == AlertTextType.noTitle,
              child: Container(),
              replacement: Visibility(
                visible: alertTextType == AlertTextType.title,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Visibility(
                        visible: alertTextType == AlertTextType.title,
                        child: MyText(fontFamily: GoogleFonts.almarai().fontFamily,
                          alien: TextAlign.center,
                          title: headTitle ?? '',
                          color: Colors.black,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                replacement: Visibility(
                  visible: alertTextType == AlertTextType.fullTitle,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: marginHeadTitle ?? 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MyText(fontFamily: GoogleFonts.almarai().fontFamily,
                              alien: TextAlign.center,
                              title: headTitle ?? '',
                              color: Colors.black,
                              size: headTitle == null ? 0 : 14,
                              fontWeight: FontWeight.bold,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: MyText(fontFamily: GoogleFonts.almarai().fontFamily,
                                alien: TextAlign.center,
                                title: subTitle ?? '',
                                color: Colors.grey,
                                size: subTitle == null ? 0 : 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (alertButtonType == AlertButtonType.noButton) Container(),
            if (alertButtonType == AlertButtonType.button)
              DefaultButton(
                title: buttonTitle ?? '',
                onTap: onTapButton ?? () {},
              ),
            if (alertButtonType == AlertButtonType.dueButton)
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      title: blueButtonTitle ?? '',
                      onTap: onTapBlueButton ?? () {},
                    ),
                  ),
                  Visibility(
                    visible: visibleWhiteButton!,
                    child: Expanded(
                      child: DefaultButton(
                        margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        color: Colors.white,
                        textColor: MyColors.black.withOpacity(.7),
                        borderColor: MyColors.greyWhite.withOpacity(.5),
                        title: whiteButtonTitle ?? '',
                        onTap: onTapWhiteButton ?? () {},
                      ),
                    ),
                    replacement: Container(),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
