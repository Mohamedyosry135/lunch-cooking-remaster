// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      name: json['name'] as String?,
      subLevels: (json['subLevels'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String?,
      iconName: json['iconName'] as String?,
      iconNamePNG: json['iconNamePNG'] as String?,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subLevels': instance.subLevels,
      'category': instance.category,
      'iconName': instance.iconName,
      'iconNamePNG': instance.iconNamePNG,
      'categoryId': instance.categoryId,
    };
