part of 'ingredients_widgets_imports.dart';

class BuildAlertDialogItem extends StatelessWidget {
  final IngredientModel model;
  final IngredientsData ingredientsData;

  const BuildAlertDialogItem(
      {Key? key, required this.model, required this.ingredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.kashmirLight),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: MyText(
                  title: model.name ?? "",
                  color: MyColors.primaryDark,
                  size: 13,
                  alien: TextAlign.center),
            ),
          ),
          VerticalDivider(color: MyColors.kashmirLight, thickness: 1, width: 0),
          Visibility(
            visible: model.subLevels == null ? true : false,
            child: Checkbox(
              side: BorderSide(color: MyColors.kashmir, width: 1),
              activeColor: MyColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              value: model.selected==1,
              onChanged: (value) =>ingredientsData.addToSelection(model),
            ),
            replacement: InkWell(
              onTap: () => ingredientsData.addToStack(model),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Icon(Icons.arrow_forward_ios,
                    size: 20, color: MyColors.kashmir),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
