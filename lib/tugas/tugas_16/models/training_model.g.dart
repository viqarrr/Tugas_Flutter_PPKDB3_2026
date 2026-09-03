// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingResponse _$TrainingResponseFromJson(Map<String, dynamic> json) =>
    TrainingResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrainingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainingResponseToJson(TrainingResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

TrainingItem _$TrainingItemFromJson(Map<String, dynamic> json) => TrainingItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
);

Map<String, dynamic> _$TrainingItemToJson(TrainingItem instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};
