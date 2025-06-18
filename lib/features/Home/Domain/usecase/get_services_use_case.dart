import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/features/Home/Data/model/Services.dart';
import 'package:flutter_task_internship/features/Home/Domain/repo/abstract_home_repo.dart';

class GetServicesUseCase{
  final HomeRepo homeRepo;
  GetServicesUseCase(this.homeRepo);

  Future<Either<Exception,List<Services>>>getServices()async{
     return await homeRepo.getServices();
  }
}