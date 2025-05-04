import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/authentication/login/data/repos/login_repo.dart';
import '../../features/authentication/login/ui/cubits/cubit/login_cubit.dart';
import '../constant/endpoints.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;
//pretty_dio_logger
void setup() {
  getIt.registerLazySingleton<Dio>(() => Dio()
    ..options.baseUrl = EndPoints.baseUrl
    ..interceptors.add(PrettyDioLogger(
      request: true,
      responseBody: true,
      requestBody: true,
      responseHeader: false,
      error: true,
    )));
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
// getIt.registerLazySingleton<DioService>(() => DioService());
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(getIt<ApiServices>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
