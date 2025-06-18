import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_color.dart';

import '../constants/app_style.dart';

class CustomButtonCore extends StatelessWidget {

  final String text;
  final void Function() onPressed;


  const CustomButtonCore({super.key,
    required this.text
    ,required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(

        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 10.h

          ),
shape: ContinuousRectangleBorder(

  borderRadius: BorderRadius.circular(10.r)
),

      backgroundColor:AppColor.purple,

      elevation: 5.sp,

    ),onPressed: onPressed, 
        child: Text(text,style: AppStyle.mediumRubik18White,));
  }
}
