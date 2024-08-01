part of 'ingredients_widgets.dart';

class IngredientsData {
  final GenericBloc<SortType> sortAZCubit = GenericBloc(SortType.ASC);
  final GenericBloc<List<CategoryModel>> listCatsCubit = GenericBloc([]);
  final GenericBloc<List<IngredientModel>> currentListCatCubit =
      GenericBloc([]);
  final GenericBloc<List<IngredientModel>> stackIngredientsCubit =
      GenericBloc([]);

  onSearchTextChanged(String text) async {
    var helper = DatabaseHelper.instance;
    if (text.isEmpty) {
      List<CategoryModel> listCats = await helper.getCatList();
      print("big list length =====================>${listCats.length}");
      listCatsCubit.onUpdateData(listCats);
    } else {
      List<CategoryModel> listCats = await helper.getSearchedCatList(text);
      print("big list length =====================>${listCats.length}");
      listCatsCubit.onUpdateData(listCats);
    }
  }

  //////////////////////////// Alert Dialog //////////////////////////////

  Future<void> _showAlertDialog(BuildContext context, IngredientModel model,
      IngredientsData ingredientsData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BuildSubLevelsAlertDialog(
          model: model,
          ingredientsData: ingredientsData,
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
  }

  //////////////////////////// Selection //////////////////////////////

  onSelectItem(
    BuildContext context, {
    required IngredientsData ingredientsData,
    required IngredientModel model,
  }) {
    print("=====selected model=======>${model.toJson()}");
    if (model.subLevels != null) {
      addToStack(model);
      _showAlertDialog(context, model, ingredientsData)
          .whenComplete(() => _getIngredientStatus(model));
    } else {
      late bool updated;
      var data = listCatsCubit.state.data;
      data.forEach((element) {
        if (element.categoryId == model.parentId) {
          element.subLevels!.forEach((subElement) async {
            if (subElement.ingredientId == model.ingredientId) {
              subElement.selected = _swishSelected(model.selected);
              updated = await _updateIngredient(subElement);
              print("=========updated==========> $updated");
              if (updated) {
                listCatsCubit.onUpdateData(data);
              }
            }
            return;
          });
          return;
        }
      });
    }
  }

  _getIngredientStatus(IngredientModel model) async {
    var helper = DatabaseHelper.instance;
    int? subIngredientsCount =
        await helper.getIngredientStatus(model.ingredientId);
    if (subIngredientsCount != null) {
      print("===== subIngredientsCount ====> $subIngredientsCount");
      late bool updated;
      var listCats = listCatsCubit.state.data;
      listCats.forEach((element) {
        if (element.categoryId == model.parentId) {
          element.subLevels!.forEach((element) async {
            if (element.ingredientId == model.ingredientId) {
              element.selected = subIngredientsCount > 0 ? 1 : 0;
              updated = await _updateIngredient(element);
              print("=========updated==========> $updated");
              if (updated) {
                listCatsCubit.onUpdateData(listCats);
              }
            }
          });
        }
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

  selectAll(IngredientModel model) {
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
      model.selected=1;
      print("][][][][][][][][][][][");
      _updateIngredient(model);
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
      model.selected=0;
      print("][][][][][][][][][][][");
      _updateIngredient(model);
    }
  }

  //////////////////////////// Local Database //////////////////////////////

  Future<void> fetchData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ingredientsFromApi = prefs.get("ingredientsFromApi");
    if (ingredientsFromApi != null) {
      bool data = json.decode("$ingredientsFromApi");
      if (data) {
        getFromDatabase();
      }
    } else {
      var data = await CustomerRepository(context).categorizedIngredient();
      if (data != null) {
        listCatsCubit.onUpdateData(data.subLevels);
        data.subLevels.forEach((element) async {
          var helper = DatabaseHelper.instance;
          await helper.insertCat({
            'name': element.name,
            'category': element.category,
            'iconName': element.iconName,
            'iconNamePNG': element.iconNamePNG,
            'categoryId': element.categoryId,
          });
          if (element.subLevels != null) {
            insertIngredient(
                ingredientList: element.subLevels!,
                parentId: element.categoryId);
          }
        });
      }
      getFromDatabase();
    }
  }

  void insertIngredient({
    required List<IngredientModel> ingredientList,
    required String parentId,
  }) {
    var helper = DatabaseHelper.instance;
    ingredientList.forEach((e) async {
      if (e.subLevels != null) {
        insertIngredient(
            ingredientList: e.subLevels!, parentId: e.ingredientId);
      }
      await helper.insertIngredient({
        'name': e.name,
        'iconName': e.iconName,
        'iconNamePNG': e.iconNamePNG,
        'selectedIconName': e.selectedIconName,
        'ingredientId': e.ingredientId,
        'parentId': parentId,
        'selected': e.selected,
      });
    });
    print("====================>insert Ingredients done}");
  }

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
    List<CategoryModel> listCats;
    listCats = await helper.getSortedCatList(sortAZCubit.state.data);
    print("big list length =====================>${listCats.length}");
    listCatsCubit.onUpdateData(listCats);
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

  getFromDatabase() async {
    var helper = DatabaseHelper.instance;
    List<CategoryModel> listCats = await helper.getCatList();
    print("big list length =====================>${listCats.length}");
    listCatsCubit.onUpdateData(listCats);
  }

  saveAll(BuildContext context) async {
    var helper = DatabaseHelper.instance;
    int? selectedCount = await helper.getSelectedCount();
    if (selectedCount != null) {
      print("===== selectedCount ====> $selectedCount");
      if (selectedCount > 0) {
       Get.back();// AutoRouter.of(context).push(HomeRoute());
      } else {
        CustomToast.showSimpleToast(
            msg: "You should select at lest one ingredient");
      }
    }
  }
}
