part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetProfileEvent extends HomeEvent{

}

final class GetServices extends HomeEvent{

}

final class GetShortCuts extends HomeEvent{

}

final class GetRest extends HomeEvent{

}
