import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/features/Home/Data/model/Services.dart';
import 'package:flutter_task_internship/features/Home/Data/model/restraunt_model.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';

import '../../Data/model/shortcuts.dart';

abstract class HomeRepo {

  Future<Either<Exception, ProfileEntity>> getProfile();
  Future<Either<Exception, List<Services>>> getServices();
  Future<Either<Exception, List<ShortCuts>>> getShortCuts();
  Future<Either<Exception, List<RestEntity>>> getRest();

}