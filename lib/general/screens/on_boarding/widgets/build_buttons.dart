part of 'on_boarding_widget_imports.dart';

class BuildButtons extends StatelessWidget {
  final OnBoardingPageData onBoardingPageData;

  const BuildButtons({required this.onBoardingPageData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: onBoardingPageData.isLastCubit,
        builder: (context, state) {
          return Visibility(
            visible: state.data,
            child: DefaultButton(
              title: "Start Cooking",
              onTap: () => onBoardingPageData.startCooking(context),
              margin: EdgeInsets.symmetric(horizontal: 50),
              gradient: MyColors.gradient,
              textColor: MyColors.white,
              fontSize: 18,
            ),
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultButton(
                  title: "skip",//tr(context, "skip"),
                  onTap: () =>     Get.rootDelegate.offNamed(Routes.LOGIN),//AutoRouter.of(context).push(LoginRoute()),
                  color: Colors.transparent,
                  textColor: MyColors.grey,
                  borderColor: Colors.transparent,
                  margin: EdgeInsets.zero,
                  fontWeight: FontWeight.normal,
                  width: 80,
                  fontSize: 20,
                ),
                DefaultButton(
                  title: "Next >",
                  onTap: () => onBoardingPageData.controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  color: Colors.transparent,
                  textColor: MyColors.primaryDark,
                  borderColor: Colors.transparent,
                  margin: EdgeInsets.zero,
                  fontWeight: FontWeight.normal,
                  width: 100,
                  fontSize: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
