part of 'sign_up_bloc.dart';

extension SignUpStateX on SignUpState{

  bool get isInitial=> signUpStateEnum==SignUpStateEnum.initial;
  bool get isSignUpLoading=> signUpStateEnum==SignUpStateEnum.signUpLoading;
  bool get isSignUpLoaded=> signUpStateEnum==SignUpStateEnum.signUpLoaded;
  bool get isSignUpError=> signUpStateEnum==SignUpStateEnum.signUpError;
  bool get isSignUpLoadedImage=> signUpStateEnum==SignUpStateEnum.imageUpload;
  bool get isSignUpErrorImage=> signUpStateEnum==SignUpStateEnum.imageFailed;

}

enum SignUpStateEnum {

  initial,
  signUpLoading,
  signUpLoaded,
  signUpError,
  imageUpload,
  imageFailed,

}

class SignUpState {

  final Exception? error;
  final SignUpStateEnum signUpStateEnum;
  final String? urlImage;

  SignUpState({
    this.urlImage,
    this.error,
    required this.signUpStateEnum,
  });

  SignUpState copyWith({
    SignUpStateEnum? signUpStateEnum,
    Exception? error,
String? urlImage
  }) {
    return SignUpState(

      error: error??this.error,
      signUpStateEnum: signUpStateEnum ?? this.signUpStateEnum,
      urlImage: urlImage??this.urlImage
    );
  }

  @override
  bool operator ==(Object other) {

    if (identical(this, other)) return true;

    return other is SignUpState &&
        other.signUpStateEnum == signUpStateEnum &&
        error==other.error
        && urlImage==other.urlImage ;
  }

  @override
  int get hashCode => Object.hash(signUpStateEnum,error,urlImage ) ;
}
