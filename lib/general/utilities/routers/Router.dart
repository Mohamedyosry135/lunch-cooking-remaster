part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true,),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: OnBoardingPage),


    //auth routes
    AdaptiveRoute(page: EmailConfirmation),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: Login),
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: ResetPassword),

    //customer routes
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: Ingredients),
    AdaptiveRoute(page: Filter),
    AdaptiveRoute(page: ShowAllIngredients),




  ],
)
class $AppRouter {}