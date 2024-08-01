part of 'home_imports.dart';
class HomeData{
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  var currentBackPressTime;

  Future<void> signOutCurrentUser(BuildContext context) async {
    try {
      LoadingDialog.showLoadingDialog();
      await Amplify.Auth.signOut().then((response) {
        print("========response=======>$response");
        EasyLoading.dismiss();
        Utils.clearSavedData();
        context.read<AuthCubit>().onUpdateAuth(false);
        Get.rootDelegate.offNamed(Routes.SPLASH);//AutoRouter.of(context).push(SplashRoute());
      });
    } on AuthException catch (e) {
      CustomToast.showSimpleToast(msg: e.message);
      print("======signOutCurrentUser=======>${e.message}");
    }
    EasyLoading.dismiss();
  }

  Future<void> signOutCurrentUserGlobally(BuildContext context) async {
    try {
      await Amplify.Auth.signOut(options: SignOutOptions(globalSignOut: true));
      Utils.clearSavedData();
      context.read<AuthCubit>().onUpdateAuth(false);
      Phoenix.rebirth(context);
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  Future<void> deleteUser(BuildContext context) async {
    try {
      await Amplify.Auth.deleteUser();
      Utils.clearSavedData();
      context.read<AuthCubit>().onUpdateAuth(false);
      Phoenix.rebirth(context);
      print('Delete user succeeded');
    } on Exception catch (e) {
      print('Delete user failed with error: $e');
    }
  }

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      //add duration of press gap
      currentBackPressTime = now;
      CustomToast.showSimpleToast(msg: "Press Back Button Again to Exit");
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }


}