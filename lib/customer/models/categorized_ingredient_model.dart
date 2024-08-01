import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';

part 'categorized_ingredient_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CategorizedIngredientModel {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'language')
  String language;
  @JsonKey(name: 'subLevels')
  List<CategoryModel> subLevels;

  CategorizedIngredientModel({required this.id, required this.language, required this.subLevels});

   factory CategorizedIngredientModel.fromJson(Map<String, dynamic> json) => _$CategorizedIngredientModelFromJson(json);

   Map<String, dynamic> toJson() => _$CategorizedIngredientModelToJson(this);
}

