part of 'show_all_ingredients_widgets_imports.dart';

class BuildSortButton extends StatelessWidget {
  final ShowAllIngredientsData showAllIngredientsData;

  const BuildSortButton({Key? key, required this.showAllIngredientsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showAllIngredientsData.getSortedCats(),
      child: BlocBuilder<GenericBloc<SortType>, GenericState<SortType>>(
        bloc: showAllIngredientsData.sortAZCubit,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
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
            ],
          );
        },
      ),
    );
  }
}
