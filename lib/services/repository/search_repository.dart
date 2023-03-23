import 'package:amdb/data/models/title/search_title_response.dart';
import 'package:amdb/services/restful/api_executor_service.dart';
import 'package:amdb/services/restful/custom_interceptor.dart';
import 'package:amdb/utils/connectivity_util.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  Future<SearchTitleResponse> search({required String searchKey}) async {
    final connectedToInternet = await ConnectivityUtil().isInternetConnected();
    var response = SearchTitleResponse();
    if (connectedToInternet) {
      await ApiExecutorService().client.search(searchKey).then((result) {
        response = result;
      }).onError((DioError error, stackTrace) {
        response.success = false;
        response.errorMessage = error.message;
      }).catchError((Object error) {
        if (error is DioError) {
          response.success = false;
          response.errorMessage = error.message;
        } else {
          response.errorMessage = CustomInterceptor.genericErrorMessage;
        }
      });

      return response;
    } else {
      response.success = false;
      response.errorMessage = 'No Internet Connection';

      return response;
    }
  }
}
