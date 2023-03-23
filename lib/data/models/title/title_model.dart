import 'package:json_annotation/json_annotation.dart';

part 'title_model.g.dart';

@JsonSerializable()
class TitleModel {
  String? id;
  String? resultType;
  String? image;
  String? title;
  String? description;

  TitleModel({
    this.id,
    this.resultType,
    this.image,
    this.title,
    this.description,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) =>
      _$TitleModelFromJson(json);

  Map<String, dynamic> toJson() => _$TitleModelToJson(this);
}
