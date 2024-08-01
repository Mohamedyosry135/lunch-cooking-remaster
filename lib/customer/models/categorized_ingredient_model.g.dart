// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorized_ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorizedIngredientModel _$CategorizedIngredientModelFromJson(
        Map<String, dynamic> json) =>
    CategorizedIngredientModel(
      id: json['_id'] as String,
      language: json['language'] as String,
      subLevels: (json['subLevels'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorizedIngredientModelToJson(
        CategorizedIngredientModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'language': instance.language,
      'subLevels': instance.subLevels,
    };
