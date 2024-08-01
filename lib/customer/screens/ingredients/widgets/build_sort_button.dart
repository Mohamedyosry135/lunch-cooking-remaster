part of 'ingredients_widgets_imports.dart';

class BuildSortButton extends StatelessWidget {
  final IngredientsData ingredientsData;

  const BuildSortButton({Key? key, required this.ingredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ingredientsData.getSortedCats(),
      child: BlocBuilder<GenericBloc<SortType>, GenericState<SortType>>(
        bloc: ingredientsData.sortAZCubit,
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                title: state.data == SortType.Prioritised
                    ? "Sort By: Prioritised"
                    : state.data == SortType.DESC
                        ? "Sort By: Z - A"
                        : "Sort By: A - Z",
                color: MyColors.kashmir,
                size: 15,
                decoration: TextDecoration.underline,
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 35,
                color: MyColors.kashmir,
              ),
              SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
