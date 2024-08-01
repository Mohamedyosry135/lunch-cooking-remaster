part of 'show_all_ingredients_widgets_imports.dart';

class BuildAlertDialogHeader extends StatelessWidget {
  final ShowAllIngredientsData showAllIngredientsData;

  const BuildAlertDialogHeader({Key? key, required this.showAllIngredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          height: 55,
          child: BlocBuilder<GenericBloc<List<IngredientModel>>,
              GenericState<List<IngredientModel>>>(
            bloc: showAllIngredientsData.stackIngredientsCubit,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // scrollDirection: Axis.horizontal,
                children: List.generate(
                  state.data.length,
                  (index) => BuildAlertDialogHeaderItem(
                    model: state.data[index],
                    showAllIngredientsData: showAllIngredientsData,
                    index: index,
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            showAllIngredientsData.stackIngredientsCubit.onUpdateData([]);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.close, size: 25, color: MyColors.white),
          ),
        ),
      ],
    );
  }
}
