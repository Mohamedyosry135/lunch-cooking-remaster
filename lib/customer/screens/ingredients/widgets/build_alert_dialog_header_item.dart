part of 'ingredients_widgets_imports.dart';

class BuildAlertDialogHeaderItem extends StatelessWidget {
  final IngredientModel model;
  final int index;
  final IngredientsData ingredientsData;

  const BuildAlertDialogHeaderItem({
    Key? key,
    required this.model,
    required this.ingredientsData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width*0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (index==0)SvgPicture.network(
            model.selectedIconName ?? "",
            height: 30,
            semanticsLabel: 'A shark?!',
            placeholderBuilder: (BuildContext context) => Container(
                // padding: const EdgeInsets.all(20.0),
                child: const CupertinoActivityIndicator()),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index!=0)InkWell(
                onTap: () => ingredientsData.deleteFromStack(context, model),
                child: Icon(Icons.close, size: 15, color: MyColors.white),
              ),
              if (index!=0)SizedBox(width: 5),
              MyText(title: model.name ?? "", color: MyColors.white, size: 13,overflow: TextOverflow.ellipsis),
            ],
          ),
        ],
      ),
    );
  }
}
