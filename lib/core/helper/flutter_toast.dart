import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_color.dart';

class FlutterToastHelper{

  FlutterToastHelper._();
  static FlutterToastHelper instance=FlutterToastHelper._();

  Future<void>showToast({Color?color,required String message})async{

    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color??AppColor.purple,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}