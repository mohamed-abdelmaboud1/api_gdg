import 'package:dio/dio.dart';

import '../constant/endpoints.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ));
  }

  @override
  delete(path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,
          queryParameters: queryParameters,
          data: isFormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data);
      return response.data;
    } on DioException catch (e) {
      // handleDioExceptions(e);
    }
  }

  @override
  get(path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      bool isFormData = false}) async {
    try {
      final response = await dio.get(path,
          queryParameters: queryParameters,
          data: isFormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data);
      return response.data;
    } on DioException catch (e) {
      // handleDioExceptions(e);
    }
  }

  @override
  post(path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          queryParameters: queryParameters,
          data: isFormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data);
      return response.data;
    } on DioException catch (e) {
      // handleDioExceptions(e);
    }
  }

  @override
  put(path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      bool isFormData = false}) async {
    try {
      final response = await dio.put(path,
          queryParameters: queryParameters,
          data: isFormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data);
      return response.data;
    } on DioException catch (e) {
      // handleDioExceptions(e);
    }
  }
}
