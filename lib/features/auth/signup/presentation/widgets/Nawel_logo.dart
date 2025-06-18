import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/appp_image.dart';

class NawelLogo extends StatelessWidget {

  const NawelLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImage.nawelTransparent,height: 336.h,width: 336.w,fit: BoxFit.contain,);
  }
}
