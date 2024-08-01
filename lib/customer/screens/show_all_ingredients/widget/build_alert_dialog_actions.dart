part of 'show_all_ingredients_widgets_imports.dart';

class BuildAlertDialogActions extends StatelessWidget {
  final ShowAllIngredientsData showAllIngredientsData;

  const BuildAlertDialogActions(
      {Key? key, required this.showAllIngredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            gradient: MyColors.gradient,
            title: "Save",
            onTap: () {
              showAllIngredientsData.stackIngredientsCubit.onUpdateData([]);
              Navigator.of(context).pop();
            },
          ),
        ),
        Expanded(
          child: DefaultButton(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            color: MyColors.white,
            borderColor: MyColors.kashmir,
            textColor: MyColors.kashmir,
            title: "Back",
            onTap: () => showAllIngredientsData.deleteFromStack(context,
                showAllIngredientsData.stackIngredientsCubit.state.data.last),
          ),
        ),
      ],
    );
  }
}
