part of 'UtilsImports.dart';

class Utils {
  static Location location = new Location();

  static void manipulateSplashData(BuildContext context) async{
    initDio(lang: "en");
    initCustomWidgets(language: "en");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userStatus = prefs.getString("userStatus");
    var userAuthorized = json.decode("$userStatus");
    print("=====userAuthorized=====>$userAuthorized");
    if (userAuthorized==true) {
      // AutoRouter.of(context).push(HomeRoute());
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }

  static initDio({required String lang}) {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      authLink: LoginRoute.name,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      branch: ApiNames.branch,
      authClick: () {  },
    );
  }

  static initCustomWidgets({required String language}) {
    WidgetUtils.init(
        style: CustomInputTextStyle(lang: language),
        primary: MyColors.primary,
        language: language,
        inputStyle: (
                {String? label,
                  String? hint,
                  Widget? prefixIcon,
                  Widget? suffixIcon,
                  Color? hintColor,
                  Color? fillColor,
                  BorderRadius? radius,
                  Color? focusBorderColor,
                  EdgeInsets? padding,
                  Color? enableColor}) =>
            CustomInputDecoration(
                lang: language,
                labelTxt: label,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enableColor: enableColor,
                customFillColor: fillColor,
                padding: padding));
  }

  // static Future<bool> manipulateLoginData(
  //     BuildContext context, dynamic data, String token) async {
  //   if (data != null) {
  //     int status = data["status"];
  //     if (status == 1) {
  //       await Utils.setDeviceId("$token");
  //       UserModel user = UserModel.fromJson(data["data"]);
  //       int type = data["data"]["type"];
  //       user.type = type == 1 ? "user" : "company";
  //       user.token = data["token"];
  //       user.lang = context.read<LangCubit>().state.locale.languageCode;
  //       GlobalState.instance.set("token", user.token);
  //       await Utils.saveUserData(true);
  //       Utils.setCurrentUserData(user, context);
  //     } else if (status == 2) {
  //       AutoRouter.of(context)
  //           .push(ActiveAccountRoute(userName: data["data"]["id"]));
  //     }
  //     return true;
  //   }
  //   return false;
  // }

  // static void setCurrentUserData(UserModel model, BuildContext context) async {
  //   context.read<UserCubit>().onUpdateUserData(model);
  //   // ExtendedNavigator.of(context).push(Routes.home,arguments: HomeArguments(parentCount: parentCount));
  // }

  static Future<void> saveUserData(bool userStatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userStatus", json.encode(userStatus));
  }

  static void changeLanguage(String lang, BuildContext context) {
    DioUtils.lang = lang;
    WidgetUtils.lang = lang;
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      CustomToast.showToastNotification("من فضلك تآكد من الرابط");
    }
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text.trim().isEmpty) {
      CustomToast.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        CustomToast.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }
}
