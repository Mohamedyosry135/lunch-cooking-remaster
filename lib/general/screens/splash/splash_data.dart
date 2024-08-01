part of 'splash_imports.dart';
class SplashData{

  checkingData(BuildContext context) {
    Utils.manipulateSplashData(context);
  }

  Future<void> configureAmplify() async {
    if (!Amplify.isConfigured){
      final authPlugin = AmplifyAuthCognito();
      await Amplify.addPlugin(authPlugin);
      try {

        await Amplify.configure(amplifyconfig);
      } on AmplifyAlreadyConfiguredException {
        print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
      }
    }
  }
}