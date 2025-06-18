import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_task_internship/core/error/handle_exception.dart';
import 'package:flutter_task_internship/features/auth/signup/data/model/sign_up_request.dart';
import 'package:flutter_task_internship/features/auth/signup/data/repo/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final SignUpRepo signUpRepo;

  SignUpBloc({required this.signUpRepo}) : super(SignUpState(signUpStateEnum: SignUpStateEnum.initial)) {
    on<SignUpEvent>((event, emit) async {

      if(event is SignUpSubmitted){

        emit(state.copyWith(

            signUpStateEnum: SignUpStateEnum.signUpLoading,

        ));

        final data= await signUpRepo.signUp(event.signUpRequest);

        data.fold((exception){
          emit(state.copyWith(
            error:exception ,
            signUpStateEnum: SignUpStateEnum.signUpError,


          ));
        }
            , (unit){

              emit(state.copyWith(
                signUpStateEnum: SignUpStateEnum.signUpLoaded,

              ));
        });
      }
      if(event is UploadImageEvent){

        final data= await signUpRepo.uploadImage(event.file!);

        data.fold((l) {
print(l.toString());
        emit(

            state.copyWith(
          signUpStateEnum: SignUpStateEnum.imageFailed,
          error: l

        )
        );

        },(r) {
          emit(state.copyWith(
            signUpStateEnum: SignUpStateEnum.imageUpload,
            urlImage: r,
          ));
        },);

      }
    }
    );
  }

}
