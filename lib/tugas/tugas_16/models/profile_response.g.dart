// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  emailVerifiedAt: json['email_verified_at'] as String?,
  jenisKelamin: json['jenis_kelamin'] as String?,
  profilePhoto: json['profile_photo'] as String?,
  batchId: (json['batch_id'] as num?)?.toInt(),
  trainingId: (json['training_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'jenis_kelamin': instance.jenisKelamin,
      'profile_photo': instance.profilePhoto,
      'batch_id': instance.batchId,
      'training_id': instance.trainingId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
