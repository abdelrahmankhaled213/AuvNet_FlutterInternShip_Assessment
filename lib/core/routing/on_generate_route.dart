import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_internship/core/Di/dependency_injection.dart';
import 'package:flutter_task_internship/features/OnBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_task_internship/features/auth/login/presentation/screens/login_screen_view.dart';
import 'package:flutter_task_internship/features/auth/login/presentation/view_model/login_bloc.dart';
import 'package:flutter_task_internship/features/auth/signup/presentation/view_model/sign_up_bloc.dart';
import 'package:flutter_task_internship/home_layout.dart';
import '../../features/auth/signup/presentation/screens/sign_up.dart';
import '../constants/app_router.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.onBoarding:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(position: Tween<Offset>(
              begin: Offset(0, 1),
              end: Offset.zero
          ).animate(animation), child: OnBoardingView());
        },);

    case AppRouter.signUp:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(position: Tween<Offset>(
              begin: Offset(0, 1),
              end: Offset.zero
          ).animate(animation), child: BlocProvider(
              create: (context) {
                return getIt<SignUpBloc>();
              }, child: SignUpScreenView()));
        },
      );

    case AppRouter.login:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(

              position: Tween<Offset>(

                  begin: Offset(0, 1),

                  end: Offset.zero

              ).animate(animation)
              , child: BlocProvider(
            create: (context) => getIt<LoginBloc>(),
            child: LoginScreenView(),
          )
          );
        },
      );

    case AppRouter.homeLayout:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(

              position: Tween<Offset>(

                  begin: Offset(0, 1),

                  end: Offset.zero

              ).animate(animation)
              , child: HomeLayout()
          );
        },
      );

    default :
      return null;
  }
}