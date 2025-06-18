import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/repo/abstract_home_repo.dart';

class GetProfile{

  final HomeRepo repo;
  GetProfile(this.repo);

  Future<Either<Exception,ProfileEntity>>getProfile() async {
    return await repo.getProfile();
  }
}