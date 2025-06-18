import 'package:bloc/bloc.dart';
import 'package:flutter_task_internship/features/Home/Data/model/Services.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_profile.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_rest.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_services_use_case.dart';
import 'package:flutter_task_internship/features/Home/Domain/usecase/get_shortcuts_useCase.dart';
import 'package:meta/meta.dart';

import '../../Data/model/shortcuts.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetProfile profile;
  final GetServicesUseCase getServicesUseCase;
  final GetShortcutsUseCase shortcuts;
  final GetRestUseCase getRestUseCase;

  HomeBloc( {required this.profile,required this.getServicesUseCase,required this.shortcuts,required this.getRestUseCase})
      : super(HomeState(
    homeStatus: HomeStatus.initial
  ))
  {

    on<HomeEvent>((event, emit) async {

if(event is GetProfileEvent){

 emit(state.copyWith(
   homeStatus: HomeStatus.getProfileLoading
 ));

 final data=await profile.getProfile();

data.fold((l) {
  emit(state.copyWith(
    exception: l,
    homeStatus: HomeStatus.getProfileError
  ));
}, (r) {
  print("name : ${r.name}");
  emit(state.copyWith(
      profileEntity: r,
      homeStatus: HomeStatus.getProfileLoaded
  ));
},);
}

if(event is GetServices){

  emit(state.copyWith(
      homeStatus: HomeStatus.isServicesLoading
  ));

  final data=await getServicesUseCase.getServices();
  data.fold((l) {

    emit(state.copyWith(
        exception: l,
        homeStatus: HomeStatus.isServicesError
    ));
  }, (r) {

    emit(state.copyWith(
services: r,
        homeStatus: HomeStatus.isServicesLoaded
    ));
  },);
}



if(event is GetShortCuts){

  emit(state.copyWith(
      homeStatus: HomeStatus.shortcutLoading
  ));

  final data=await shortcuts.getShortCuts();
  data.fold(
        (e){
          emit(state.copyWith(
              homeStatus: HomeStatus.shortcutError,
              exception: e
          ));
        }, (r) {
print(r[0].name);
    emit(
        state.copyWith(
        homeStatus: HomeStatus.shortcutLoaded,
        shortcuts: r
    ));
  },);
}


if(event is GetRest){

  emit(state.copyWith(
      homeStatus: HomeStatus.restLoading
  ));


  final data=await getRestUseCase.getRest();

  data.fold(
        (e){
      emit(state.copyWith(
          homeStatus: HomeStatus.restError,
          exception: e
      ));
    }, (r) {

    print(r[0].name);

    emit(
        state.copyWith(
            homeStatus: HomeStatus.restLoaded,
            rest: r
        ));
  },);
}



}
        );



  }

}

