part of 'CustomerRepoImports.dart';

class CustomerHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CustomerHttpMethods(this.context);


  Future<CategorizedIngredientModel?> categorizedIngredient() async {
    var lang=context.read<LangCubit>().state.locale.languageCode;
    var data = await GenericHttp<CategorizedIngredientModel?>(context).callApi(
      name: ApiNames.categorizedIngredient+"/$lang",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => CategorizedIngredientModel.fromJson(json),
      showLoader: true,
    ) as CategorizedIngredientModel?;

    if (data != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("ingredients", json.encode(data.toJson()));
      prefs.setString("ingredientsFromApi", json.encode(true));
      return data;
    }else{
      return null;
    }
  }

}
