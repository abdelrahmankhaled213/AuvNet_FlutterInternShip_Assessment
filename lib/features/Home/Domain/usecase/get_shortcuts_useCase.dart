
import 'package:dartz/dartz.dart';
import 'package:flutter_task_internship/features/Home/Data/model/shortcuts.dart';

import '../repo/abstract_home_repo.dart';

class GetShortcutsUseCase{

  final HomeRepo homeRepo;
  GetShortcutsUseCase(this.homeRepo);

  Future<Either<Exception,List<ShortCuts>>>getShortCuts()async{
    return await homeRepo.getShortCuts();
  }
}