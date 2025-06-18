import 'package:bloc/bloc.dart';
import 'package:flutter_task_internship/features/auth/login/Data/model/login_model.dart';
import 'package:meta/meta.dart';

import '../../Data/repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepo loginRepo;

  LoginBloc(
      this.loginRepo
      ) : super(LoginState.initial()) {

      on<LoginButtonPressed>(_handleLogin);

    }



  Future<void>_handleLogin(
      LoginButtonPressed event,
      Emitter<LoginState> emit,)async {

    emit(state.copyWith(status: LoginStatus.loading));

    final result = await loginRepo.login(event.loginModel);

    result.fold(
          (failure) => emit(state.copyWith(
        status: LoginStatus.error,
        error: failure,
      )),
          (_) => emit(state.copyWith(
        status: LoginStatus.success,
        error: null,
      )),
    );

  }


}
