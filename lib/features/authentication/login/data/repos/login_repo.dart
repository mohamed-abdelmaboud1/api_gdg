import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommerce/features/authentication/login/data/models/login_user_model.dart';

import '../../../../../core/constant/endpoints.dart';
import '../../../../../core/failures/failure.dart';
import '../../../../../core/services/api_service.dart';

abstract class LoginRepo {
  Future<Either<Failure, ResponseUserModel>> login(
      {required LoginRequestModel loginRequestModel});
}

class LoginRepoImpl implements LoginRepo {
  final ApiServices apiServices;
  LoginRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, ResponseUserModel>> login(
      {required LoginRequestModel loginRequestModel}) async {
    try {
      final Response response = await apiServices.postRequest(
        endpoint: EndPoints.signIn,
        data: loginRequestModel.toJson(),
      );
      // final String token = response.data['token'];
      // print(token);
      // await CacheManager.setData(key: Keys.token, value: token);
      return Right(ResponseUserModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.response!.data);
      return Left(Failure(
          e.response!.data['message'] ?? 'An error occurred during login'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
