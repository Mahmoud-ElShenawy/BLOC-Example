import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';



part 'albums_model.g.dart';


List<AlbumsModel> albumFromJson(var str) =>
    List<AlbumsModel>.from(str.map((x) => AlbumsModel.fromJson(x)));

String albumToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@immutable
@JsonSerializable()
class AlbumsModel extends Equatable {
  final int? userId;
  final int? id;
  final String? title;

  const AlbumsModel({
    this.userId,
    this.id,
    this.title,
  });

  factory AlbumsModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsModelToJson(this);

  @override
  List<Object?> get props => [userId, id, title];

  @override
  bool operator ==(Object other) =>
      other is AlbumsModel &&
      other.userId == userId &&
      other.id == id &&
      other.title == title;

  @override
  int get hashCode => hashValues(userId, id, title);
}
