import 'package:json_annotation/json_annotation.dart';

part 'training_model.g.dart';

@JsonSerializable()
class TrainingResponse {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "data")
  final List<TrainingItem>? data;

  TrainingResponse({this.message, this.data});

  factory TrainingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingResponseToJson(this);
}

@JsonSerializable()
class TrainingItem {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  TrainingItem({required this.id, required this.title});

  factory TrainingItem.fromJson(Map<String, dynamic> json) =>
      _$TrainingItemFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingItemToJson(this);
}
