part of 'auth_repo_imports.dart';

class AuthHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  AuthHttpMethods(this.context);

  //Amplify Auth
  Future<void> signInUser(String email, String password) async {
    bool isSignedIn = false;
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      isSignedIn = result.isSignedIn;
      if (isSignedIn) {
        print("===signIn result===>${result}");
        CustomToast.showSimpleToast(msg: "You are logged in successfully");
        await Utils.saveUserData(isSignedIn);
        context.read<AuthCubit>().onUpdateAuth(isSignedIn);
        // AutoRouter.of(context).push(HomeRoute());
        GET.Get.rootDelegate.offNamed(Routes.HOME);
      }
    } on UserNotConfirmedException catch (e) {
      print("===signInUserError===>${e.message}");
      CustomToast.showSimpleToast(msg: e.message);
      // AutoRouter.of(context).push(
      //     ActiveAccountRoute(userName: "", password: password, email: email));
      GET.Get.rootDelegate.toNamed(Routes.ACTIVE_ACCOUNT,arguments: [
        {"userName": ""},
        {"password": password},
        {"email":email}
      ]);
    } on AuthException catch (e) {
      CustomToast.showSimpleToast(msg: e.message);
    }
  }

  Future<void> signup(String email, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    try {
      var dio = Dio();
      Response response = await dio.post(ApiNames.signup, data: body);
      print("======== response =======>$response");
      if (response.data != null) {
        CustomToast.showSimpleToast(msg: response.data["message"] ?? "");
        if (response.statusCode == 200) {
          // AutoRouter.of(context).push(ActiveAccountRoute(
          //     userName: response.data["data"]["username"],
          //     password: password,
          //     email: email));
          GET.Get.rootDelegate.toNamed(Routes.ACTIVE_ACCOUNT,arguments: [
            {"userName":response.data["data"]["username"]},
            {"password": password},
            {"email":email}
          ]);
        }
      }
    } on DioError catch (error) {
      print("======== DioError =======>${error.response!.data["message"]}");
      CustomToast.showSimpleToast(msg: error.response!.data["message"]);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final ResetPasswordResult result = await Amplify.Auth.resetPassword(
        username: email,
      );
      print("======trueeeeeee======>${result.nextStep.updateStep}");
      CustomToast.showSimpleToast(msg: "Code sent to your successfully");
      // AutoRouter.of(context).push(EmailConfirmationRoute(email: email));
      GET.Get.rootDelegate.toNamed(Routes.EMAIL_CONFIRMATION,arguments: [
        {"email":email}

      ]);
    } on AuthException catch (e) {
      print("===resendSignUpCode===>${e.message}");
      CustomToast.showSimpleToast(msg: e.message);
    }
  }

  Future<void> confirmResetPassword(
      String email, String pass, String code) async {
    try {
      UpdatePasswordResult response = await Amplify.Auth.confirmResetPassword(
          username: email, newPassword: pass, confirmationCode: code);
      print("======response======>${response}");
      GET.Get.rootDelegate.offNamed(Routes.LOGIN);//AutoRouter.of(context).push(LoginRoute());
    } on AmplifyException catch (e) {
      print("======error====>$e");
    }
  }

  Future<bool> confirmSignup(
      String email, String code, String username, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "code": code,
      "username": username,
    };
    try {
      var dio = Dio();
      Response response = await dio.post(ApiNames.confirmSignup, data: body);
      print("======== response =======>$response");
      if (response.data != null) {
        if (response.statusCode == 200) {
          return true;
        }
        return false;
      }
      return false;
    } on DioError catch (error) {
      print("======== DioError =======>${error.response!.data["message"]}");
      CustomToast.showSimpleToast(msg: error.response!.data["message"]);
      return false;
    }
  }

  Future<void> resendSignup(String email) async {
    Map<String, dynamic> body = {
      "email": email,
    };
    try {
      var dio = Dio();
      Response response = await dio.post(ApiNames.resendSignup, data: body);
      print("======== response =======>$response");
      if (response.data != null) {
        CustomToast.showSimpleToast(msg: response.data["message"] ?? "");
      }
    } on DioError catch (error) {
      print("======== DioError =======>${error.response!.data["message"]}");
      CustomToast.showSimpleToast(msg: error.response!.data["message"]);
    }
  }

  Future<void> signInWithSocialWebUI(AuthProvider provider) async {
    try {
      bool isSignedIn = false;
      final result = await Amplify.Auth.signInWithWebUI(provider: provider);
      isSignedIn = result.isSignedIn;
      if (isSignedIn) {
        print("===signIn result===>${result.isSignedIn}");
        CustomToast.showSimpleToast(msg: "You are logged in successfully");
        await Utils.saveUserData(isSignedIn);
        context.read<AuthCubit>().onUpdateAuth(isSignedIn);
        GET.Get.rootDelegate.offNamed(Routes.HOME);//AutoRouter.of(context).push(HomeRoute());
      }
    } on UserNotConfirmedException catch (e) {
      print("=====${provider.name} UserNotConfirmedException====>${e.message}");
      CustomToast.showSimpleToast(msg: e.message);
    } on AuthException catch (e) {
      print("=====${provider.name} AuthException====>${e.message}");
      CustomToast.showSimpleToast(msg: e.message);
    }
  }

// Future<void> signUpUser(String username, String password) async {
//   bool isSignUpComplete = false;
//   try {
//     final userAttributes = <CognitoUserAttributeKey, String>{
//       CognitoUserAttributeKey.email: 'email@domain.com',
//       CognitoUserAttributeKey.phoneNumber: '+15559101234',
//       // additional attributes as needed
//     };
//     final result = await Amplify.Auth.signUp(
//       username: username,
//       password: password,
//       // options: CognitoSignUpOptions(userAttributes: userAttributes),
//     );
//     isSignUpComplete = result.isSignUpComplete;
//     if (isSignUpComplete) {
//       CustomToast.showSimpleToast(
//           msg: "Great, now you can active your account ");
//       // AutoRouter.of(context)
//       //     .push(ActiveAccountRoute(userName: username, password: password));
//     }
//   } on AuthException catch (e) {
//     print("===signUpUserError===>${e.message}");
//     CustomToast.showSimpleToast(msg: e.message);
//   }
// }

// Future<void> resendSignUpCode(String email) async {
//   try {
//     final result = await Amplify.Auth.resendSignUpCode(username: email);
//     print(
//         "======resendSignUpCode======>${result.codeDeliveryDetails.destination}");
//     CustomToast.showSimpleToast(msg: "Code sent to your successfully");
//   } on AuthException catch (e) {
//     print("===resendSignUpCode===>${e.message}");
//     CustomToast.showSimpleToast(msg: e.message);
//   }
// }

// Future<void> confirmUser(
//     String username, String pass, String confirmationCode) async {
//   // Create a boolean for checking the sign up status
//   bool isSignUpComplete = false;
//
//   try {
//     final result = await Amplify.Auth.confirmSignUp(
//         username: username, confirmationCode: confirmationCode);
//
//     isSignUpComplete = result.isSignUpComplete;
//     if (isSignUpComplete) {
//       await signInUser(username, pass);
//     }
//   } on AuthException catch (e) {
//     print("===confirmUserError===>${e.message}");
//     CustomToast.showSimpleToast(msg: e.message);
//   }
// }

}
