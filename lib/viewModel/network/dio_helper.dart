import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({required String path, Map<String, dynamic>? queryParameters,String? token}) async {
    try{
      Response response=await
      dio.get(
          path,
          queryParameters: queryParameters,
          options: (Options(
              headers: {
                'Authorization' :'Bearer $token',
              }
          ))
      );
      return response;
    }
    catch (e){rethrow;}
  }
  static Future<Response> post({required String path, Map<String, dynamic>? data, String? token, Map<String, dynamic>? queryParameters}) async {
    try{
      Response response=await
      dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: (
              Options(
                  headers: {
                    'Authorization' :'Bearer $token',
                  }
              ))
      );
      return response;
    }
    catch (e){rethrow;}
  }
  static Future<Response> delete ({required String path,String? token}) async {
    try{
      Response response=await
      dio.delete(path,
          options: (Options(headers: { 'Authorization' :'Bearer $token',})));
      return response;
    }
    catch (e){rethrow;}
  }
}