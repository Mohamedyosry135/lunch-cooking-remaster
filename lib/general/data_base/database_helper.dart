import 'package:base_flutter/customer/models/category_model.dart';
import 'package:base_flutter/customer/models/ingredient_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

enum SortType {
  ASC,
  DESC,
  Prioritised,
}

class DatabaseHelper {
  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initializeDatabase();
    return _database;
  }

  String catTable = 'cat_table';
  String ingredientTable = 'ingredient_table';
  String colCatId = 'categoryId';
  String colIngredientId = 'ingredientId';
  String colName = 'name';

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'categorizedIngredients.db';

    // Open/create the database at a given path
    var catsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return catsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    Batch batch = db.batch();

    batch.execute('''
  CREATE TABLE $catTable (
  categoryId TEXT NOT NULL PRIMARY KEY,
  name TEXT,
  category TEXT,
  iconName TEXT,
  iconNamePNG TEXT,
  subLevels TEXT
  )
  ''');

    batch.execute('''
  CREATE TABLE $ingredientTable (
  ingredientId TEXT NOT NULL PRIMARY KEY,
  name TEXT,
  iconName TEXT,
  iconNamePNG TEXT,
  selectedIconName TEXT,
  parentId TEXT,
  selected INTEGER )
  ''');
    await batch.commit();

    print("Create database =========================>");
  }

  // Fetch Operation: Get all cat objects from database
  Future<List<Map<String, dynamic>>> _getCatMapList() async {
    Database? db = await this.database;
    var result = await db!.rawQuery('SELECT * FROM $catTable');
    // var result = await db!.query(catTable, orderBy: '$colName ASC');
    return result;
  }

  // Insert Operation: Insert a cat object to database
  Future<int> insertCat(Map<String, dynamic> categoryModel) async {
    Database? db = await this.database;
    var result = await db!.insert(catTable, categoryModel);
    return result;
  }

  // Update Operation: Update a cat object and save it to database
  Future<int> updateIngredient(Map<String, dynamic> ingredientModel) async {
    var db = await this.database;
    var result = await db!.update(ingredientTable, ingredientModel,
        where: '$colIngredientId = ?', whereArgs: [ingredientModel["ingredientId"]]);
    return result;
  }

  // Delete Operation: Delete a cat object from database
  Future<int> deleteAll() async {
    var db = await this.database;
    int result =
        await db!.rawDelete('DELETE FROM $catTable ');
    return result;
  }

  // Delete Operation: Delete a cat object from database
  Future<bool> deleteMyDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cats.db';
    await deleteDatabase(path);
    return true;
  }

  // Get number of selected objects in database
  Future<int?> getSelectedCount() async {
    Database? db = await this.database;
    List<Map<String, dynamic>> x =
        await db!.rawQuery('SELECT COUNT (*) from $ingredientTable WHERE selected=1');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get number of selected objects in database
  Future<int?> getIngredientStatus(String parentId) async {
    Database? db = await this.database;
    List<Map<String, dynamic>> x =
    await db!.rawQuery('SELECT COUNT (*) from $ingredientTable WHERE parentId=? and selected = ?', ['$parentId','1']);
    return Sqflite.firstIntValue(x);
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'cat List' [ List<cat> ]
  Future<List<CategoryModel>> getCatList() async {
    var catMapList = await _getCatMapList(); // Get 'Map List' from database
    int count =
        catMapList.length; // Count the number of map entries in db table
    List<CategoryModel> catList = [];
    // For loop to create a 'cat List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      var element = CategoryModel.fromJson(catMapList[i]);
      element.subLevels = await getIngredientsById(element.categoryId);
      catList.add(element);
    }
    return catList;
  }

  Future<List<CategoryModel>> getSearchedCatList(String searchText) async {
    var catMapList = await _getCatMapList(); // Get 'Map List' from database
    int count =
        catMapList.length; // Count the number of map entries in db table
    List<CategoryModel> catList = [];
    // For loop to create a 'cat List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      var element = CategoryModel.fromJson(catMapList[i]);
      element.subLevels = await searchInIngredients(parentId: element.categoryId,searchText: searchText);
      print("=========>element :${element.toJson()}");
      catList.add(element);
    }
    return catList;
  }

  Future<List<CategoryModel>> getSortedCatList(SortType sortType) async {
    Database? db = await this.database;
    if(sortType==SortType.Prioritised){
      return getCatList();
    }
    var catMapList = await db!.query(catTable, orderBy: '$colName ${sortType.name}');
    int count =
        catMapList.length; // Count the number of map entries in db table
    List<CategoryModel> catList = [];
    // For loop to create a 'cat List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      var element = CategoryModel.fromJson(catMapList[i]);
      element.subLevels = await sortedIngredients(element.categoryId,sortType);
      catList.add(element);
    }
    return catList;
  }

  ///////////////////////////////////////////////////////////////

  // Insert Operation: Insert a ingredient object to database
  Future<int> insertIngredient(Map<String, dynamic> ingredientModel) async {
    Database? db = await this.database;
    var result = await db!.insert(ingredientTable, ingredientModel);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'ingredient List' [ List<ingredient> ] by parentId
  Future<List<IngredientModel>> getIngredientsById(String parentId) async {
    Database? db = await this.database;
    var ingredientMapList = await db!.rawQuery(
        'SELECT * FROM $ingredientTable WHERE parentId=?', ['$parentId']);
    List<IngredientModel> list=await _toListIngredientModels(ingredientMapList);
    list.forEach((e) async {
      var subList=await getIngredientsById(e.ingredientId);
      if (subList.isNotEmpty) {
        e.subLevels=subList;
      }
    });
    return list;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'ingredient List' [ List<ingredient> ] by parentId
  Future<List<IngredientModel>> searchInIngredients(
      {required String parentId, required String searchText}) async {
    Database? db = await this.database;
    var ingredientMapList = await db!.rawQuery(
        'SELECT * FROM $ingredientTable WHERE parentId=? and name LIKE ?',
        ['$parentId', '$searchText%']);
    print("=======map=======>$ingredientMapList");
    List<IngredientModel> list=await _toListIngredientModels(ingredientMapList);
    list.forEach((e) async {
      var subList=await getIngredientsById(e.ingredientId);
      if (subList.isNotEmpty) {
        e.subLevels=subList;
      }
    });
    return list;
    // return _toListIngredientModels(ingredientMapList);
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'ingredient List' [ List<ingredient> ] by parentId
  Future<List<IngredientModel>> sortedIngredients(
      String parentId, SortType sortType) async {
    Database? db = await this.database;
    var ingredientMapList = await db!.query(ingredientTable,
        orderBy: 'name ${sortType.name}', where: 'parentId=?', whereArgs: ['$parentId']);
    List<IngredientModel> list=await _toListIngredientModels(ingredientMapList);
    list.forEach((e) async {
      var subList=await getIngredientsById(e.ingredientId);
      if (subList.isNotEmpty) {
        e.subLevels=subList;
      }
    });
    return list;
    // return _toListIngredientModels(ingredientMapList);
  }

  Future<List<IngredientModel>> _toListIngredientModels(
      List<Map<String, dynamic>> ingredientMapList) async {
    int count = ingredientMapList.length;
    List<IngredientModel> ingredientList = [];
    for (int i = 0; i < count; i++) {
      ingredientList.add(IngredientModel.fromJson(ingredientMapList[i]));
    }
    return ingredientList;
  }
}
