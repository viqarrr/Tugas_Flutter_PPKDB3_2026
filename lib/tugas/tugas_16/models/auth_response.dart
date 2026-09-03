import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "data")
  final AuthData? data;

  AuthResponse({this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthData {
  @JsonKey(name: "token")
  final String? token;

  @JsonKey(name: "user")
  final AuthUser? user;

  AuthData({this.token, this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

@JsonSerializable()
class AuthUser {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "email_verified_at")
  final String? emailVerifiedAt;

  @JsonKey(name: "jenis_kelamin")
  final String? jenisKelamin;

  @JsonKey(name: "profile_photo")
  final String? profilePhoto;

  @JsonKey(name: "batch_id")
  final int? batchId;

  @JsonKey(name: "training_id")
  final int? trainingId;

  @JsonKey(name: "created_at")
  final String? createdAt;

  @JsonKey(name: "updated_at")
  final String? updatedAt;

  AuthUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.jenisKelamin,
    this.profilePhoto,
    this.batchId,
    this.trainingId,
    this.createdAt,
    this.updatedAt,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
