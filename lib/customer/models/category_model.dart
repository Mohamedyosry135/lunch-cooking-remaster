import 'package:json_annotation/json_annotation.dart';

import 'ingredient_model.dart';

part 'category_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CategoryModel {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'subLevels')
  List<IngredientModel>? subLevels;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'iconName')
  String? iconName;
  @JsonKey(name: 'iconNamePNG')
  String? iconNamePNG;
  @JsonKey(name: 'categoryId')
  String categoryId;

  CategoryModel({this.name, this.subLevels, this.category, this.iconName, this.iconNamePNG, required this.categoryId});

   factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

