// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      name: json['name'] as String?,
      subLevels: (json['subLevels'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      iconName: json['iconName'] as String?,
      iconNamePNG: json['iconNamePNG'] as String?,
      selectedIconName: json['selectedIconName'] as String?,
      ingredientId: json['ingredientId'] as String,
      parentId: json['parentId'] as String?,
      selected: json['selected'] as int? ?? 0,
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subLevels': instance.subLevels,
      'iconName': instance.iconName,
      'iconNamePNG': instance.iconNamePNG,
      'selectedIconName': instance.selectedIconName,
      'ingredientId': instance.ingredientId,
      'parentId': instance.parentId,
      'selected': instance.selected,
    };
