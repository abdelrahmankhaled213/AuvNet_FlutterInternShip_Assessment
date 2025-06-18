import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';

import '../Entity/profile_entity.dart';
import '../repo/abstract_home_repo.dart';

class GetRestUseCase{

  final HomeRepo repo;
  GetRestUseCase(this.repo);

  Future<Either<Exception,List<RestEntity>>>getRest() async {
    return await repo.getRest();
  }

}