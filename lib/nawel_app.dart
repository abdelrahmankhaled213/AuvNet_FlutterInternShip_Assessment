import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_router.dart';
import 'package:flutter_task_internship/core/constants/cache_keys.dart';
import 'package:flutter_task_internship/core/helper/shared_pref_helper.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';
import 'package:flutter_task_internship/core/routing/on_generate_route.dart';

class NawelApp extends StatelessWidget {

  const NawelApp({super.key});


  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

     splitScreenMode: true,

      designSize: Size(375, 812),
      builder:
          (context, child) {

       return MaterialApp(

initialRoute:
// SharedPrefHelper.instance
//     .getData(key: isOnBoardingViewed)??false?
// SupaBaseHelper.instance.isLoggedIn?
// AppRouter.homeLayout:AppRouter.login:
// AppRouter.onBoarding,
AppRouter.onBoarding,
         debugShowCheckedModeBanner: false,

         onGenerateRoute: generateRoute,

         title: 'Flutter intern',

       );
          }

    );
  }
}
