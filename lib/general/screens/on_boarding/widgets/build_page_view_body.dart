part of 'on_boarding_widget_imports.dart';
class BuildPageViewBody extends StatelessWidget {
  final OnBoardingPageData onBoardingPageData;

  const BuildPageViewBody({required this.onBoardingPageData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: onBoardingPageData.controller,
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        onPageChanged: (index) => onBoardingPageData.isLastCubit
            .onUpdateData(
            WelcomeModel(context: context).data[index].last),
        children: List.generate(
          3,
              (index) => BuildPageViewItem(
            onBoardingPageData: onBoardingPageData,
            model: WelcomeModel(context: context).data[index],
          ),
        ),
      ),
    );
  }
}
