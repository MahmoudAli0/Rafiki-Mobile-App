import 'package:dio/dio.dart';

class DioHelper {
  static var dio= Dio();
  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://projectwebadvanced.onrender.com',
          receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type': 'application/json',
      'Authorization':token,

    };
    return await dio.get(url
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    FormData? formData,
    String lang = 'en',
    token,
  }) async {
    final options = Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    if (formData != null) {
      return dio.post(
        url,
        queryParameters: query,
        data: formData,
        options: options,
      );
    }

    return dio.post(
      url,
      queryParameters: query,
      data: data,
      options: options,
    );
  }



  static Future<Response> putData(
      {
        required String url,
        Map<String, double>? query,
        required Map<String, dynamic> data,
        String lang='en',
        String? token,
      }) async{
    dio.options.headers={
      'Content-Type': 'application/json',
      'Authorization':token
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
