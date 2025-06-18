part of 'home_bloc.dart';

extension home on HomeState{

  bool get isInitial => homeStatus == HomeStatus.initial;

  bool get isProfileLoading => homeStatus == HomeStatus.getProfileLoading;

  bool get isProfileLoaded => homeStatus == HomeStatus.getProfileLoaded;

  bool get isProfileError => homeStatus == HomeStatus.getProfileError;

  bool get isServicesLoading => homeStatus == HomeStatus.isServicesLoading;

  bool get isServicesLoaded => homeStatus == HomeStatus.isServicesLoaded;

  bool get isServicesError => homeStatus == HomeStatus.isServicesError;


  bool get isShortCutLoading => homeStatus == HomeStatus.shortcutLoading;

  bool get isShortCutLoaded => homeStatus == HomeStatus.shortcutLoaded;

  bool get isShortCutError => homeStatus == HomeStatus.shortcutError;

  bool get isRestLoading => homeStatus == HomeStatus.restLoading;

  bool get isRestLoaded => homeStatus == HomeStatus.restLoaded;

  bool get isRestError => homeStatus == HomeStatus.restError;


}

enum HomeStatus {

  initial,
  getProfileLoading,
  getProfileLoaded,
  getProfileError,
  isServicesLoading,
  isServicesLoaded,
  isServicesError,
  shortcutLoading,
  shortcutLoaded,
  shortcutError,
  restLoading,
  restLoaded
  ,restError,
}

class HomeState {
  final HomeStatus homeStatus;
  final ProfileEntity? profileEntity;
  final Exception? exception;
  final List<Services>?services;
  final List<ShortCuts>?shortcuts;
  final List<RestEntity>?rest;

  const HomeState({
    this.services,
    required this.homeStatus,
    this.profileEntity,
    this.exception,
     this.shortcuts,
    this.rest
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    ProfileEntity? profileEntity,
    Exception? exception,
    List<Services>?services,
    List<ShortCuts>?shortcuts,
    List<RestEntity>?rest,
  }) {
    return HomeState(

      homeStatus: homeStatus ?? this.homeStatus,
      profileEntity: profileEntity ?? this.profileEntity,
      exception: exception ?? this.exception,
      services: services??this.services,
      shortcuts: shortcuts??this.shortcuts,
      rest: rest??this.rest

    );
  }
  @override
  bool operator ==(Object other) {

    if (identical(this, other)) return true;

    return other is HomeState &&
        other.homeStatus == homeStatus &&
        other.profileEntity == profileEntity &&
        other.exception.toString() == exception.toString()&&
    other.services == services
        && other.shortcuts==shortcuts
        && other.rest==rest

    ;
  }

  @override
  int get hashCode =>
      homeStatus.hashCode ^
      profileEntity.hashCode ^
      exception.toString().hashCode
      ^services.hashCode
      ^ shortcuts.hashCode
      ^ rest.hashCode ;
}

