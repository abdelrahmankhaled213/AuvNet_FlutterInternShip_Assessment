import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/core/error/handle_exception.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';
import 'package:flutter_task_internship/features/auth/signup/data/model/sign_up_request.dart';
import 'package:supabase/supabase.dart';

class SignUpRepo{

  Future<Either<Exception,Unit>>signUp(SignUpRequest signUpRequest) async {
    try {

      await SupaBaseHelper.instance.signUp(signUpRequest);
      return Right(unit);

    } on AuthException catch(e){

return Left( ServerException(errorMsg: e.message, statusCode:e.statusCode??"500" ));

    }on Exception catch(e){
      return Left(ServerException(
        statusCode: "404", errorMsg: e.toString()
      ));
    }

  }

  Future<Either<Exception,String>>uploadImage(File file) async {
    try {

      final imageUrl = await SupaBaseHelper.instance.uploadAvatar(file);

   return Right(imageUrl);


    } on StorageException catch(e){

      return Left(ServerException(
        errorMsg: e.message,statusCode: e.statusCode!
      ));

    }on PostgrestException catch(e){
      print(e.toString());
      return Left(ServerException(
          errorMsg: e.message,
      )
      );
    }

    on Exception catch(e){
print(e.toString());
      return Left(e);
    }


  }


}