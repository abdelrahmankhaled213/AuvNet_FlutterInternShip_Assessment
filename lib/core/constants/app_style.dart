import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/helper/font_weight_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

abstract class AppStyle{

  static TextStyle get mediumRubik28Black => GoogleFonts.rubik(

    fontSize: 28.sp,
  fontWeight: FontWeightHelper.medium,
  color: AppColor.black,

  );

  static TextStyle get mediumRubik18White => GoogleFonts.rubik(

    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,

  );

  static TextStyle get regularRubik14grey => GoogleFonts.rubik(

    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.grey,

  );

  static TextStyle get lightMulish14LightGrey=>GoogleFonts.mulish(

    fontSize: 14.sp,

    fontWeight: FontWeightHelper.light,

    color: Colors.grey[400],



  );

  static TextStyle get boldDmSans14blue=>GoogleFonts.dmSans(

      color: AppColor.blue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold

  );

  static TextStyle get regularPoppins12Purple=>GoogleFonts.dmSans(

      color: AppColor.purple,
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular

  );

  static TextStyle get boldRubik30White=>GoogleFonts.rubik(

      color: AppColor.white,
      fontSize: 30.sp,
      fontWeight: FontWeightHelper.bold

  );


}