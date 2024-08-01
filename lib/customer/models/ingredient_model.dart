import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class IngredientModel {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'subLevels')
  List<IngredientModel>? subLevels;
  @JsonKey(name: 'iconName')
  String? iconName;
  @JsonKey(name: 'iconNamePNG')
  String? iconNamePNG;
  @JsonKey(name: 'selectedIconName')
  String? selectedIconName;
  @JsonKey(name: 'ingredientId')
  String ingredientId;
  @JsonKey(name: 'parentId')
  String? parentId;
  int selected;

  IngredientModel({
    this.name,
    this.subLevels,
    this.iconName,
    this.iconNamePNG,
    this.selectedIconName,
    required this.ingredientId,
    this.parentId,
    this.selected = 0,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
