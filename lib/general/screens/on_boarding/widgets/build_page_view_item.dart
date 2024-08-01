part of 'on_boarding_widget_imports.dart';

class BuildPageViewItem extends StatelessWidget {
  final WelcomeModel model;
  final OnBoardingPageData onBoardingPageData;

  const BuildPageViewItem({required this.model, required this.onBoardingPageData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Image.asset(
            model.image ?? "",
            width: model.index! <= 1
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.9,
          ),
        ),
        MyText(
          title: model.desc ?? "",
          size: 30,
          color: MyColors.primaryDark,
          fontWeight: FontWeight.bold,
          alien: TextAlign.center,
        ),
      ],
    );
  }
}
