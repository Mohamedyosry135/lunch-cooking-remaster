part of 'on_boarding_page_imports.dart';

class OnBoardingPageData {
  PageController controller = PageController();
  GenericBloc<int> pagesCubit = new GenericBloc(0);
  GenericBloc<bool> isLastCubit = new GenericBloc(false);
  late List<Widget> data ;

  void startCooking(BuildContext context)async{
    // AutoRouter.of(context).push(LoginRoute());
    Get.rootDelegate.offNamed(Routes.LOGIN);
  }
}
