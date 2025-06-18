import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/Di/dependency_injection.dart';
import 'package:flutter_task_internship/core/helper/hive_helper.dart';
import 'package:flutter_task_internship/core/helper/shared_pref_helper.dart';
import 'package:flutter_task_internship/core/helper/supa_base_helper.dart';

import 'nawel_app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await SharedPrefHelper.instance.init();

  await SupaBaseHelper.instance.init();

  await HiveHelper.instance.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

   setupServiceLocator();

  runApp(const NawelApp());

}

