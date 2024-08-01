import 'package:base_flutter/new_lib/routes/app_pages.dart';
import 'package:base_flutter/new_lib/services/auth_service.dart';
import 'package:get/get.dart';


class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      // final userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;
      // if (userInfo != null && userInfo.data!.accessToken!.isNotEmpty) {
      //   request.headers.putIfAbsent(
      //       "Authorization",
      //       () =>
      //           ('${userInfo.data!.tokenType ?? ""} ${userInfo.data!.accessToken ?? ""}'));
      // }

      request.headers.putIfAbsent(
          "Accept-Language", () => AuthService.to.language ?? 'ar');

      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      if (response.unauthorized || response.status.code == 401) {
        AuthService.to.logout();
        Get.rootDelegate.offNamed(Routes.LOGIN);
      }
      return response;
    });
  }
}
