import 'package:flutter_task_internship/features/Home/Data/repo/home_repo.dart';
import 'package:flutter_task_internship/features/Home/Domain/repo/abstract_home_repo.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_profile.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_rest.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_services_use_case.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_shortcuts_useCase.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';
import 'package:flutter_task_internship/features/auth/login/Data/repo/login_repo.dart';
import 'package:flutter_task_internship/features/auth/login/presentation/view_model/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task_internship/features/auth/signup/data/repo/sign_up_repo.dart';

import '../../features/auth/signup/presentation/view_model/sign_up_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  // Blocs

  getIt.registerFactory(() => SignUpBloc(signUpRepo: getIt()));
  getIt.registerFactory(() => LoginBloc(getIt()));
  getIt.registerFactory(() => HomeBloc(
      getServicesUseCase: getIt()
      ,profile: getIt()
      , shortcuts: getIt(), getRestUseCase: getIt()),
    
  
  );


  // Repositories

  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo());

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());

  // UseCases

  getIt.registerLazySingleton<GetProfile>(() => GetProfile(getIt()));

  getIt.registerLazySingleton<GetServicesUseCase>(() => GetServicesUseCase(getIt()));

  getIt.registerLazySingleton<GetShortcutsUseCase>(() => GetShortcutsUseCase(getIt()));

  
  getIt.registerLazySingleton<GetRestUseCase>(() => GetRestUseCase(getIt()));





}
