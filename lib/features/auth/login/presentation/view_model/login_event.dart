part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginButtonPressed extends LoginEvent{

   final LoginModel loginModel;

  LoginButtonPressed({
    required this.loginModel
});

}