part of 'ingredients_widgets_imports.dart';

class BuildAlertDialogActions extends StatelessWidget {
  final IngredientsData ingredientsData;

  const BuildAlertDialogActions({Key? key, required this.ingredientsData})
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
              ingredientsData.stackIngredientsCubit.onUpdateData([]);
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
            onTap: () => ingredientsData.deleteFromStack(
                context, ingredientsData.stackIngredientsCubit.state.data.last),
          ),
        ),
      ],
    );
  }
}
