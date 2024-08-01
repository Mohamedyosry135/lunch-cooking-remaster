part of 'ingredients_widgets_imports.dart';

class BuildAlertDialogHeader extends StatelessWidget {
  final IngredientsData ingredientsData;

  const BuildAlertDialogHeader({Key? key, required this.ingredientsData})
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
            bloc: ingredientsData.stackIngredientsCubit,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // scrollDirection: Axis.horizontal,
                children: List.generate(
                  state.data.length,
                  (index) => BuildAlertDialogHeaderItem(
                    model: state.data[index],
                    ingredientsData: ingredientsData,
                    index: index,
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            ingredientsData.stackIngredientsCubit.onUpdateData([]);
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
