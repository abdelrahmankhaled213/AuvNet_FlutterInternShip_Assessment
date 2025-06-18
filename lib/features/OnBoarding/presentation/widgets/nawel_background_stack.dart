import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/appp_image.dart';

class OnBoardingBackgroundStack extends StatelessWidget {

  const OnBoardingBackgroundStack({super.key});

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 447.h,
      width: 460.w,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [

          Positioned(right: 130.w,top:-70.h, child: Image.asset(AppImage.curve
            ,height: 342.h,width: 342.w,fit: BoxFit.contain,)),

          Positioned(top: 70.h,right:50.w,left:50.w,child: Image.asset(AppImage.nawel,height: 336.h,width: 336.w
            ,fit: BoxFit.contain,))

        ],
      ),
    );
  }
}
