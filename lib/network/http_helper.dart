import 'package:dio/dio.dart';
import 'package:news_app/shared/constants.dart';

class Http
{
  // ca063cd942134589b01f1ec12d623b4a
  static Dio dio = Dio();

  static void init(){
    dio = Dio(BaseOptions(
      baseUrl: apiBaseUrl,
      receiveDataWhenStatusError: true
    ));
  }

  static Future<Response> get({required String path, Map<String, dynamic>? parameters})
  {
    if(parameters!.isEmpty){
      parameters  = {};
    }
    return dio.get(path, queryParameters: parameters);
  }
}
