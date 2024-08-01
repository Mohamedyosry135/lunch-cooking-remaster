part of 'show_all_ingredients_widgets_imports.dart';

class BuildSubLevelsAlertDialog extends StatelessWidget {
  final IngredientModel model;
  final ShowAllIngredientsData showAllIngredientsData;

  const BuildSubLevelsAlertDialog(
      {Key? key, required this.model, required this.showAllIngredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0),
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          color: MyColors.alertDialogBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildAlertDialogHeader(showAllIngredientsData: showAllIngredientsData),
            Container(
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<GenericBloc<List<IngredientModel>>,
                      GenericState<List<IngredientModel>>>(
                    bloc: showAllIngredientsData.currentListCatCubit,
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                side: BorderSide(color: MyColors.kashmir, width: 1),
                                activeColor: MyColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                value: state.data.every((element) => element.selected==1),
                                onChanged: (value) =>showAllIngredientsData.selectAll(),
                              ),
                              MyText(
                                  title: "All",
                                  color: MyColors.primaryDark,
                                  size: 13,
                                  alien: TextAlign.center),
                            ],
                          ),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: List.generate(
                              state.data.length,
                              (index) => BuildAlertDialogItem(
                                showAllIngredientsData: showAllIngredientsData,
                                model: state.data[index],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  BuildAlertDialogActions(showAllIngredientsData: showAllIngredientsData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
