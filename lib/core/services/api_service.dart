import 'dart:async';

import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
//setup dio instance
  ApiServices(
    this.dio,
  );

  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> putRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> deleteRequest({
    required String endpoint,
    String? token,
  }) async {
    return await dio.delete(
      endpoint,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<Response> patchRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.patch(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
