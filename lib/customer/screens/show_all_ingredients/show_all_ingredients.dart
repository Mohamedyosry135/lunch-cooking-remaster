part of 'show_all_ingredients_imports.dart';

class ShowAllIngredients extends StatefulWidget {
  final CategoryModel categoryModel;

  const ShowAllIngredients({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  State<ShowAllIngredients> createState() => _ShowAllIngredientsState();
}

class _ShowAllIngredientsState extends State<ShowAllIngredients> {
  ShowAllIngredientsData showAllIngredientsData = ShowAllIngredientsData();

  @override
  void initState() {
    showAllIngredientsData.categoryCubit.onUpdateData(widget.categoryModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 25),
          onPressed: () => AutoRouter.of(context).pop()),
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
            onChange: (query) =>
                showAllIngredientsData.onSearchTextChanged(query),
          ),
        ],
      ),
      title: "Choose Ingredients!",
      scaffoldBody: BlocBuilder<GenericBloc<CategoryModel?>,
          GenericState<CategoryModel?>>(
        bloc: showAllIngredientsData.categoryCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSortButton(showAllIngredientsData: showAllIngredientsData,),
                  MyText(
                    title: state.data!.name ?? "",
                    size: 25,
                    color: MyColors.primaryDark,
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 130,
                          mainAxisExtent: 90,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      children: List.generate(
                        state.data!.subLevels!.length,
                        (index) => BuildItem(
                          showAllIngredientsData: showAllIngredientsData,
                          ingredientModel: state.data!.subLevels![index],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
      floatingActionButton: DefaultButton(
        width: 150,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        gradient: MyColors.gradient,
        title: "Save",
        onTap: () =>AutoRouter.of(context).pop(),
      ),
    );
  }
}
