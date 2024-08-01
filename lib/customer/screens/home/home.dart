part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeData homeData=HomeData();
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      scaffoldBody: WillPopScope(
        onWillPop: ()=>homeData.onWillPop(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MyText(
                title: "Let's eat \nQuality food",
                size: 36,
                color: MyColors.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            GenericTextField(
              fillColor: MyColors.bgTF,
              enableBorderColor: MyColors.white,
              radius: BorderRadius.circular(30),
              fieldTypes: FieldTypes.clickable,
              hint: "Search food...",
              margin: const EdgeInsets.symmetric(vertical: 15),
              action: TextInputAction.done,
              type: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.search, size: 30, color: MyColors.kashmir),
              validate: (value) => value!.noValidate(),
              onTab: ()=>Get.rootDelegate.toNamed(Routes.FILTER) ,// AutoRouter.of(context).push(FilterRoute()),
            ),
            Center(
              child: Text("home", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(Res.ingredients),
        onPressed: ()=>Get.rootDelegate.toNamed(Routes.INGREDIENTS)//AutoRouter.of(context).push(IngredientsRoute()),
      ),
    );
    // return Scaffold(
    //   key: homeData.scaffold,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     leading: DrawerIcon(
    //       onTap: () => homeData.scaffold.currentState!.openDrawer(),
    //     ),
    //     actions: [
    //       IconButton(
    //           onPressed: () => homeData.signOutCurrentUser(context),
    //           // onPressed: () => homeData.signOutCurrentUserGlobally(context),
    //           icon: Icon(Icons.login_outlined)),
    //       // IconButton(
    //       //     onPressed: () => homeData.deleteUser(context),
    //       //     icon: Icon(Icons.delete_forever)),
    //     ],
    //   ),
    //   drawer: SafeArea(
    //     child: SizedBox(
    //       width: MediaQuery.of(context).size.width * 0.85,
    //       child: Drawer(
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //         child: Column(
    //           children: [
    //             BackdropFilter(
    //               filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
    //               child: Container(
    //                 alignment: Alignment.centerLeft,
    //                 height: 70,
    //                 child: IconButton(
    //                     icon: Icon(Icons.close,
    //                         size: 30, color: MyColors.primaryDark),
    //                     onPressed: () => Navigator.pop(context)),
    //               ),
    //             ),
    //             Expanded(
    //               child: Stack(
    //                 alignment: Alignment.bottomLeft,
    //                 children: [
    //                   Container(
    //                     height: double.infinity,
    //                     width: double.infinity,
    //                     padding: EdgeInsets.all(20),
    //                     decoration: BoxDecoration(
    //                       color: MyColors.kashmirLight,
    //                       borderRadius: BorderRadius.horizontal(
    //                           right: Radius.circular(10)),
    //                     ),
    //                     child: MyText(
    //                         title: "Hello, Abeer!",
    //                         color: MyColors.primaryDark,
    //                         size: 22),
    //                   ),
    //                   Container(
    //                     margin: const EdgeInsets.only(top: 70, right: 50),
    //                     decoration: BoxDecoration(
    //                       color: MyColors.white,
    //                       borderRadius: BorderRadius.horizontal(
    //                           right: Radius.circular(10)),
    //                     ),
    //                     child: ListView(
    //                       children: List.generate(
    //                         4,
    //                             (index) => Column(
    //                           children: [
    //                             ListTile(
    //                               dense: true,
    //                               title: MyText(
    //                                   title: "To-Buy List",
    //                                   size: 16,
    //                                   color: MyColors.black),
    //                               onTap: () {
    //                                 Navigator.pop(context);
    //                               },
    //                             ),
    //                             Divider(
    //                               color: MyColors.kashmirLight,
    //                               endIndent: 10,
    //                               indent: 10,
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   body: WillPopScope(
    //     onWillPop: ()=>homeData.onWillPop(context),
    //     child: Center(
    //       child: Text("home", style: TextStyle(fontSize: 30)),
    //     ),
    //   ),
    //   floatingActionButton: DefaultButton(
    //     width: MediaQuery
    //         .of(context)
    //         .size
    //         .width * 0.35,
    //     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    //     gradient: MyColors.gradient,
    //     title: "Ingredients",
    //     onTap: () async{
    //       AutoRouter.of(context).push(IngredientsRoute());
    //     },
    //   ),
    // );
  }
}
