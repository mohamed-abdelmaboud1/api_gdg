import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/failures/failure.dart';
import '../../../data/models/login_user_model.dart';
import '../../../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  String email = '';
  String password = '';
  LoginCubit(
    this.loginRepo,
  ) : super(LoginInitial());

  void login() async {
    emit(LoginLoading());
final result = await loginRepo.login(
          loginRequestModel: LoginRequestModel(
            email: email,
            password: password,
          ),
    );
    return result.fold(
      (failure) => emit(LoginFailure(failure)),
      (model) => emit(LoginSuccess(
        model,
      )),
    );
  }
}
