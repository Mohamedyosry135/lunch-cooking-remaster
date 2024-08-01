part of 'on_boarding_page_imports.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final OnBoardingPageData onBoardingPageData = new OnBoardingPageData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: AuthScaffold(
        child: Column(
          children: [
            BuildPageViewBody(onBoardingPageData: onBoardingPageData),
            PageIndicator(
              count: 3,
              controller: onBoardingPageData.controller,
              color: MyColors.greyWhite,
              size: 14,
              space: 10,
              activeColor: MyColors.primary,
              layout: PageIndicatorLayout.WARM,
            ),
            BuildButtons(onBoardingPageData: onBoardingPageData)
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
