import 'package:amdb/services/logger_service.dart';
import 'package:amdb/services/restful/api_client.dart';
import 'package:amdb/services/restful/custom_interceptor.dart';
import 'package:dio/dio.dart';

class ApiExecutorService {
  ///Constructor
  static final ApiExecutorService _instance = ApiExecutorService._internal();

  ApiExecutorService._internal();

  factory ApiExecutorService() {
    return _instance;
  }

  ///Dio
  late Dio _dio;
  Dio get dioInstance => _dio;
  ///

  ///API client
  late APIClient _apiClient;
  APIClient get client => _apiClient;
  ///

  static const Duration timeOutDurationInMillis = Duration(seconds: 30);
  static const String _baseUrl = 'https://imdb-api.com/';

  void initService() {
    LoggerService.log.i('Initializing API service');
    _initMainDio();
    _apiClient = APIClient(_dio);
  }

  void _initMainDio() {
    _dio = Dio();
    _dio.options.followRedirects = false;
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = timeOutDurationInMillis;
    _dio.options.receiveTimeout = timeOutDurationInMillis;
    _dio.interceptors.clear();
    _dio.interceptors.add(CustomInterceptor());
  }
}
