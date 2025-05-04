import 'package:dio/dio.dart';
import 'package:marketi_ecommerce/core/helpers/cache_manager.dart';
import 'package:marketi_ecommerce/core/utils/keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioService {
  static late Dio dio;

  static const Duration _timeOut = Duration(seconds: 30);

  static Dio getDio() {
    if (!isDioInitialized()) {
      _initializeDio();
    }
    return dio;
  }

  static bool isDioInitialized() => dio != null;

  static void _initializeDio() {
    dio = Dio()
      ..options.connectTimeout = _timeOut
      ..options.receiveTimeout = _timeOut;

    _addDioHeaders();
    _addDioInterceptor();
  }

  static Future<void> _addDioHeaders() async {
    final token = await CacheManager.getData(key: Keys.token);
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void _addDioInterceptor() {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
