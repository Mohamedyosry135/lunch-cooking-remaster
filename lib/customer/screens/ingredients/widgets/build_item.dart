part of 'ingredients_widgets_imports.dart';

class BuildItem extends StatelessWidget {
  final IngredientModel ingredientModel;
  final IngredientsData ingredientsData;

  const BuildItem({
    Key? key,
    required this.ingredientModel,
    required this.ingredientsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ingredientsData.onSelectItem(
        context,
        model: ingredientModel,
        ingredientsData: ingredientsData,
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
