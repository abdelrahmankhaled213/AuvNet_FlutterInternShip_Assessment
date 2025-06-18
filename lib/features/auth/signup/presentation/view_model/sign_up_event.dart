part of 'sign_up_bloc.dart';


@immutable
sealed class SignUpEvent {}

final class SignUpSubmitted extends SignUpEvent {

  final SignUpRequest signUpRequest;

  SignUpSubmitted({
    required this.signUpRequest
  });

}

final class UploadImageEvent extends SignUpEvent {

  final File? file ;

  UploadImageEvent({
required this.file
  });

}