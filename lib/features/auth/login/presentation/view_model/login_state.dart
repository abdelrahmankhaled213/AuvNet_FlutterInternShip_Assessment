part of 'login_bloc.dart';

extension LoginStateX on LoginState{

  bool get isInitial=>status==LoginStatus.initial;
  bool get isLoading=>status==LoginStatus.loading;
  bool get isLoaded=>status==LoginStatus.success;
  bool get isError=>status==LoginStatus.error;

}

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState {

  final LoginStatus status;
  final Exception? error;

  const LoginState({
    required this.status,
    this.error,
  });

  factory LoginState.initial() => const LoginState(status: LoginStatus.initial);

  LoginState copyWith({
    LoginStatus? status,
    Exception? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginState &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              error == other.error;

  @override
  int get hashCode => Object.hash(status, error);
}
