part of 'ingredients_widgets.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  IngredientsData ingredientsData = IngredientsData();

  @override
  void initState() {
    ingredientsData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      bottomAppBar: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "What you have?",
            size: 20,
            color: MyColors.grey,
          ),
          GenericTextField(
            fillColor: MyColors.bgTF,
            enableBorderColor: MyColors.white,
            radius: BorderRadius.circular(30),
            fieldTypes: FieldTypes.normal,
            hint: "Search food...",
            margin: const EdgeInsets.symmetric(vertical: 15),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.search, size: 30, color: MyColors.kashmir),
            validate: (value) => value!.noValidate(),
            onChange: (query) => ingredientsData.onSearchTextChanged(query),
          ),
        ],
      ),
      title: "Choose Ingredients!",
      scaffoldBody: BlocBuilder<GenericBloc<List<CategoryModel>>,
          GenericState<List<CategoryModel>>>(
        bloc: ingredientsData.listCatsCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            if (state.data.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BuildSortButton(ingredientsData: ingredientsData),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      children: [
                        ...List.generate(
                          state.data.length,
                          (index) => BuildCategoryItem(
                            ingredientsData: ingredientsData,
                            categoryModel: state.data[index],
                            index: index,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: MyText(
                    title: "No ingredients", color: Colors.red, size: 20),
              );
            }
          } else {
            return LoadingDialog.showLoadingView();
          }
        },
      ),
      floatingActionButton: DefaultButton(
        width: 150,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        gradient: MyColors.gradient,
        title: "Save",
        onTap: () =>ingredientsData.saveAll(context),
      ),
      // floatingActionButton: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     DefaultButton(
      //       width: 150,
      //       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      //       gradient: MyColors.gradient,
      //       // title: "Save",
      //       title: "clear shared",
      //       onTap: () async {
      //         Utils.clearSavedData();
      //         var helper = DatabaseHelper.instance;
      //         await helper.deleteAll();
      //         // AutoRouter.of(context).push(HomeRoute());
      //       },
      //     ), DefaultButton(
      //       width: 150,
      //       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      //       gradient: MyColors.gradient,
      //       title: "Delete database",
      //       onTap: () async {
      //         var helper = DatabaseHelper.instance;
      //         await helper.deleteMyDatabase();
      //       },
      //     ),
      //   ],
      // ),
    );
  }


}
