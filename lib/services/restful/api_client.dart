import 'package:amdb/data/models/title/search_title_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  static const String _apiKey = 'k_1u11bu0b';
  static const String _lang = 'en';


  @GET('/$_lang/API/Search/$_apiKey/{expression}')
  Future<SearchTitleResponse> search(@Path('expression') String expression);
}