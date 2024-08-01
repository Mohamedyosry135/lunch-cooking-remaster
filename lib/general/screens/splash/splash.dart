part of 'splash_imports.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  SplashData splashData = SplashData();

  @override
  void initState() {
    splashData.checkingData(context);
    splashData.configureAmplify();
    DatabaseHelper.instance.initializeDatabase();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AuthScaffold(
        child: AnimationContainer(
          index: 0,
          vertical: true,
          duration: Duration(milliseconds: 1500),
          distance: MediaQuery
              .of(context)
              .size
              .height * .3,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Res.splash,
                    ),
                    const SizedBox(height: 15),
                    MyText(title: "What I Will Cook",
                        color: MyColors.primaryDark,
                        size: 40,
                        fontWeight: FontWeight.bold),
                    MyText(
                        title: "Today?", color: MyColors.primaryDark, size: 40),
                    const SizedBox(height: 15),
                    MyText(title: "Get the perfect recipes",
                        color: MyColors.primary,
                        size: 20),
                  ],
                ),
              ),
              DefaultButton(
                margin: EdgeInsets.symmetric(horizontal: 50),
                gradient: MyColors.gradient,
                title: "Get Started",
                onTap: () => Get.rootDelegate.offNamed(Routes.ON_BOARDING_PAGE_ROUTE),
              ),
              DefaultButton(
                margin: EdgeInsets.fromLTRB(50, 10, 50, 30),
                color: MyColors.white,
                borderColor: MyColors.kashmir,
                textColor: MyColors.kashmir,
                title: "Already have an account",
                onTap: () => Get.rootDelegate.offNamed(Routes.LOGIN),//AutoRouter.of(context).push(LoginRoute()),
                // onTap: () =>AutoRouter.of(context).push(IngredientsRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
