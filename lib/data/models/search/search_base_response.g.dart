// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBaseResponse _$SearchBaseResponseFromJson(Map<String, dynamic> json) =>
    SearchBaseResponse(
      searchType: json['searchType'] as String?,
      expression: json['expression'] as String?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$SearchBaseResponseToJson(SearchBaseResponse instance) =>
    <String, dynamic>{
      'searchType': instance.searchType,
      'expression': instance.expression,
      'success': instance.success,
      'message': instance.message,
      'errorMessage': instance.errorMessage,
    };
