part of 'show_all_ingredients_widgets_imports.dart';
class BuildItem extends StatelessWidget {
  final IngredientModel ingredientModel;
  final ShowAllIngredientsData showAllIngredientsData;

  const BuildItem({
    Key? key,
    required this.ingredientModel,
    required this.showAllIngredientsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAllIngredientsData.onSelectItem(
        context,
        model: ingredientModel,
        showAllIngredientsData: showAllIngredientsData,
      ),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ingredientModel.selected==1 ? MyColors.kashmirLight : MyColors.white,
          border: Border.all(color: MyColors.kashmir),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              ingredientModel.iconName ?? "",
              height: 35,
              semanticsLabel: 'A shark?!',
              placeholderBuilder: (BuildContext context) => Container(
                  // padding: const EdgeInsets.all(20.0),
                  child: const CupertinoActivityIndicator()),
            ),
            MyText(
              title: ingredientModel.name ?? "",
              size: 16,
              color: MyColors.primaryDark,
              alien: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
