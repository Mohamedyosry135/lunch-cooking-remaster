part of 'ingredients_widgets_imports.dart';

class BuildCategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final IngredientsData ingredientsData;
  final int index;

  const BuildCategoryItem({
    Key? key,
    required this.categoryModel,
    required this.ingredientsData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categoryModel.subLevels!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: categoryModel.name ?? "",
                size: 25,
                color: MyColors.primaryDark,
              ),
              Visibility(
                visible: categoryModel.subLevels!.length > 6,
                child: InkWell(
                  onTap: () async{
                    await AutoRouter.of(context).push(
                        ShowAllIngredientsRoute(categoryModel: categoryModel));
                    ingredientsData.getFromDatabase();
                  },
                  child: MyText(
                    title: "Show all",
                    color: MyColors.kashmir,
                    size: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
                replacement: SizedBox(),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            height: 190,
            width: double.infinity,
            child: BlocBuilder<GenericBloc<List<CategoryModel>>,
                GenericState<List<CategoryModel>>>(
              bloc: ingredientsData.listCatsCubit,
              builder: (context, state) {
                if (state.data[index].subLevels != null) {
                  return GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 90,
                        mainAxisExtent: 120,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    children: List.generate(
                      categoryModel.subLevels!.length,
                      (index) => BuildItem(
                        ingredientsData: ingredientsData,
                        ingredientModel: categoryModel.subLevels![index],
                      ),
                    ),
                  );
                } else {
                  return CupertinoActivityIndicator();
                }
              },
            ),
          ),
          SizedBox(height: 20)
        ],
      );
    } else {
      return Container();
    }
  }
}
