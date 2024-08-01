import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/new_lib/consts/themes.dart';
import 'package:base_flutter/new_lib/lang/translation_service.dart';
import 'package:base_flutter/new_lib/routes/app_pages.dart';
import 'package:base_flutter/new_lib/services/auth_service.dart';
import 'package:base_flutter/new_lib/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tf_validator/localization/SetLocalization.dart';
import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(BuildContext context, child){
          return MultiBlocProvider(
            providers: MainData.providers(context),
            child: BlocBuilder<LangCubit, LangState>(
              builder: (context, state) {
                return   GetMaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  enableLog: true,
                  logWriterCallback: Logger.write,
                  theme: Themes.light,
                  themeMode: ThemeMode.light,
                  getPages: AppPages.routes,
                  locale: Locale(AuthService.to.language != null
                      ? AuthService.to.language.toString()
                      : 'ar'),
                  fallbackLocale: TranslationService.fallbackLocale,
                  supportedLocales: const [Locale('ar', ''), Locale('en', '')],
                  translations: TranslationService(),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                );
              },
            ),
          );
        }

    );
  }
}
