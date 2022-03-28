// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumsModel _$AlbumsModelFromJson(Map<String, dynamic> json) => AlbumsModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$AlbumsModelToJson(AlbumsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
