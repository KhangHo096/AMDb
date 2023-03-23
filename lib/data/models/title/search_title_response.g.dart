// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTitleResponse _$SearchTitleResponseFromJson(Map<String, dynamic> json) =>
    SearchTitleResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TitleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..searchType = json['searchType'] as String?
      ..expression = json['expression'] as String?
      ..success = json['success'] as bool?
      ..message = json['message'] as String?
      ..errorMessage = json['errorMessage'] as String?;

Map<String, dynamic> _$SearchTitleResponseToJson(
        SearchTitleResponse instance) =>
    <String, dynamic>{
      'searchType': instance.searchType,
      'expression': instance.expression,
      'success': instance.success,
      'message': instance.message,
      'errorMessage': instance.errorMessage,
      'results': instance.results,
    };
