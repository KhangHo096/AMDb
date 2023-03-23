import 'package:amdb/data/models/search/search_base_response.dart';
import 'package:amdb/data/models/title/title_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_title_response.g.dart';

@JsonSerializable()
class SearchTitleResponse extends SearchBaseResponse {
  List<TitleModel>? results;

  SearchTitleResponse({
    this.results,
  });

  factory SearchTitleResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTitleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchTitleResponseToJson(this);
}
