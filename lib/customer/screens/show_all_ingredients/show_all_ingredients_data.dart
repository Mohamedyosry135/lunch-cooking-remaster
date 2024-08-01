part of 'show_all_ingredients_imports.dart';

class ShowAllIngredientsData {
  final GenericBloc<CategoryModel?> categoryCubit = GenericBloc(null);
  final GenericBloc<SortType> sortAZCubit = GenericBloc(SortType.ASC);
  final GenericBloc<List<IngredientModel>> currentListCatCubit =
      GenericBloc([]);
  final GenericBloc<List<IngredientModel>> stackIngredientsCubit =
      GenericBloc([]);

  onSearchTextChanged(String text) async {
    var helper = DatabaseHelper.instance;
    CategoryModel categoryModel = categoryCubit.state.data!;
    if (text.isEmpty) {
      categoryModel.subLevels =
          await helper.getIngredientsById(categoryModel.categoryId);
      categoryCubit.onUpdateData(categoryModel);
    } else {
      categoryModel.subLevels = await helper.searchInIngredients(
          parentId: categoryModel.categoryId, searchText: text);
      categoryCubit.onUpdateData(categoryModel);
    }
  }

  _getIngredientStatus(IngredientModel model) async {
    var helper = DatabaseHelper.instance;
    int? subIngredientsCount =
        await helper.getIngredientStatus(model.ingredientId);
    if (subIngredientsCount != null) {
      print("===== subIngredientsCount ====> $subIngredientsCount");
      late bool updated;
      var data = categoryCubit.state.data;
      data!.subLevels!.forEach((element) async {
        if (element.ingredientId == model.ingredientId) {
          element.selected = subIngredientsCount > 0 ? 1 : 0;
          updated = await _updateIngredient(element);
          print("=========updated==========> $updated");
          if (updated) {
            categoryCubit.onUpdateData(data);
          }
        }
      });
    }
  }

  //////////////////////////// Alert Dialog //////////////////////////////

  Future<void> _showAlertDialog(BuildContext context, IngredientModel model,
      ShowAllIngredientsData showAllIngredientsData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BuildSubLevelsAlertDialog(
          model: model,
          showAllIngredientsData: showAllIngredientsData,
        );
      },
    );
  }

  addToStack(IngredientModel model) {
    currentListCatCubit.onUpdateData(model.subLevels!);
    var list = stackIngredientsCubit.state.data;
    list.add(model);
    stackIngredientsCubit.onUpdateData(list);
  }

  deleteFromStack(BuildContext context, IngredientModel model) {
    var stack = stackIngredientsCubit.state.data;
    stack.removeRange(stack.indexOf(model), stack.length);
    stackIngredientsCubit.onUpdateData(stack);
    if (stackIngredientsCubit.state.data.isEmpty) {
      Navigator.of(context).pop();
    } else {
      currentListCatCubit
          .onUpdateData(stackIngredientsCubit.state.data.last.subLevels ?? []);
    }
    _getIngredientStatus(model);
  }

  //////////////////////////// Selection //////////////////////////////

  onSelectItem(
    BuildContext context, {
    required ShowAllIngredientsData showAllIngredientsData,
    required IngredientModel model,
  }) {
    print("=====selected model=======>${model.toJson()}");
    if (model.subLevels != null) {
      addToStack(model);
      _showAlertDialog(context, model, showAllIngredientsData)
          .whenComplete(() => _getIngredientStatus(model));
    } else {
      late bool updated;
      var data = categoryCubit.state.data;
      data!.subLevels!.forEach((subElement) async {
        if (subElement.ingredientId == model.ingredientId) {
          subElement.selected = _swishSelected(model.selected);
          updated = await _updateIngredient(subElement);
          print("=========updated==========> $updated");
          if (updated) {
            categoryCubit.onUpdateData(data);
          }
        }
        return;
      });
    }
  }

  int _swishSelected(int value) {
    if (value == 0) {
      return 1;
    } else {
      return 0;
    }
  }

  addToSelection(IngredientModel model) {
    print("=========addToSelection==========>");
    late bool updated;
    var data = currentListCatCubit.state.data;
    data.forEach((element) async {
      if (element.ingredientId == model.ingredientId) {
        element.selected = _swishSelected(element.selected);
        updated = await _updateIngredient(element);
        print("=========updated==========> $updated");
        if (updated) {
          currentListCatCubit.onUpdateData(data);
        }
      }
    });
  }

  selectAll() {
    late bool updated;
    List<IngredientModel> currentList = currentListCatCubit.state.data;
    if (currentList.every((element) => element.selected == 1)) {
      currentList.map((element) async {
        element.selected = 0;
        updated = await _updateIngredient(element);
        print("=========updated==========> $updated");
        if (updated) {
          currentListCatCubit.onUpdateData(currentList);
        }
        return element;
      }).toList();
    } else {
      currentList.map((element) async {
        element.selected = 1;
        updated = await _updateIngredient(element);
        print("=========updated==========> $updated");
        if (updated) {
          currentListCatCubit.onUpdateData(currentList);
        }
        return element;
      }).toList();
    }
  }

  //////////////////////////// Local Database //////////////////////////////

  Future<bool> _updateIngredient(IngredientModel ingredientModel) async {
    var helper = DatabaseHelper.instance;
    int response = await helper.updateIngredient({
      'name': ingredientModel.name,
      'iconName': ingredientModel.iconName,
      'iconNamePNG': ingredientModel.iconNamePNG,
      'selectedIconName': ingredientModel.selectedIconName,
      'ingredientId': ingredientModel.ingredientId,
      'parentId': ingredientModel.parentId,
      'selected': ingredientModel.selected,
    });
    print("========== updateIngredient response========> $response");
    if (response != 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getSortedCats() async {
    var helper = DatabaseHelper.instance;
    CategoryModel categoryModel = categoryCubit.state.data!;
    if (sortAZCubit.state.data == SortType.Prioritised) {
      categoryModel.subLevels =
          await helper.getIngredientsById(categoryModel.categoryId);
    } else {
      categoryModel.subLevels = await helper.sortedIngredients(
          categoryModel.categoryId, sortAZCubit.state.data);
    }
    categoryCubit.onUpdateData(categoryModel);
    var sortType = sortAZCubit.state.data;
    if (sortType == SortType.Prioritised) {
      sortType = SortType.ASC;
    } else if (sortType == SortType.ASC) {
      sortType = SortType.DESC;
    } else {
      sortType = SortType.Prioritised;
    }
    sortAZCubit.onUpdateData(sortType);
  }
}
