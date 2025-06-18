import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/core/error/handle_exception.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';
import 'package:flutter_task_internship/features/Home/Data/Mapper/mapper.dart';
import 'package:flutter_task_internship/features/Home/Data/model/Services.dart';
import 'package:flutter_task_internship/features/Home/Data/model/profile.dart';
import 'package:flutter_task_internship/features/Home/Data/model/restraunt_model.dart';
import 'package:flutter_task_internship/features/Home/Data/model/shortcuts.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/repo/abstract_home_repo.dart';

import '../../../../core/helper/hive_helper.dart';
import '../model/cached_profile_model.dart';

class HomeRepoImpl extends HomeRepo {

  @override
  Future<Either<Exception, ProfileEntity>> getProfile() async {
    try {

      final cachedProfile = HiveHelper.instance.getProfile();

      if (cachedProfile != null) {
        final cached = cachedProfile.toProfile();
        return Right(toProfileEntity(cached));
      }


      final response = await SupaBaseHelper.instance.getProfile();

      print("al response:$response");

      final profile = Profile.fromJson(response);

      await HiveHelper.instance.saveProfile(
          CachedProfileModel.formProfile(profile));

      return Right(toProfileEntity(profile));
    }
    catch (e) {

      print(e.toString());

      return Left(ServerException(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Services>>> getServices() async {
    final response = await SupaBaseHelper.instance.getServices();
    try {
      final List<Services>services = (response as List<dynamic>).map((e) {
        return Services.fromJson(e);
      },).toList();

      return Right(services);
    } catch (e) {
      return Left(ServerException(
        errorMsg: e.toString(),

      )
      );
    }
  }

  @override
  Future<Either<Exception, List<ShortCuts>>> getShortCuts() async{
  try {

    final response = await SupaBaseHelper.instance.getShortCuts();

    final List<ShortCuts>shortcuts=(response as List<dynamic>).map((e) {
      return ShortCuts.fromJson(e);
    },).toList();

    return Right(shortcuts);

  }
  catch(e){
    return Left(ServerException(errorMsg: e.toString()));
  }
  }

  @override
  Future<Either<Exception, List<RestEntity>>> getRest() async{
 try{

final response=await SupaBaseHelper.instance.getRest();


final List<RestEntity>restEntity=response.map((e) {
  return  toRestEntity(e);
},).toList();


return Right(restEntity);


 }catch(e){

   return Left(ServerException(errorMsg: e.toString()));
 }

  }

}