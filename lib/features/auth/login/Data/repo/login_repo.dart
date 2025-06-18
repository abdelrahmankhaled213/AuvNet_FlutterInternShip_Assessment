import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';
import 'package:flutter_task_internship/features/auth/login/Data/model/login_model.dart';
import 'package:supabase/supabase.dart';

class LoginRepo {

  Future<Either<Exception,Unit>>login(LoginModel loginModel)async{

    try {

     await SupaBaseHelper.instance.login(loginModel);
     return Right(unit);

   }on AuthException catch(e){
     return Left(e);
   }on Exception catch(e){
     return Left(e);
   }
  }
}