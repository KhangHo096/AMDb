import 'package:json_annotation/json_annotation.dart';

part 'search_base_response.g.dart';

@JsonSerializable()
class SearchBaseResponse {
  String? searchType;
  String? expression;

  bool? success;
  String? message;
  String? errorMessage;

  SearchBaseResponse({
    this.searchType,
    this.expression,
    this.success,
    this.message,
    this.errorMessage,
  });

  factory SearchBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBaseResponseToJson(this);
}
