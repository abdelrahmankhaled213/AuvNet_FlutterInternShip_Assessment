import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';

import '../constants/app_color.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String hint;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String? value)? validator;

const CustomTextFormField({

   this.prefixIcon,
   this.suffixIcon,
    required this.validator,
this.obscureText,
    super.key
  ,required this.hint
    ,required this.textEditingController});

  @override
  Widget build(BuildContext context) {


      return TextFormField(
cursorColor: Colors.grey[400],

      obscureText: obscureText??false,

        validator: validator,


      decoration: InputDecoration(

         fillColor: AppColor.white,
          filled: true,

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

hint: Text(hint,style:  AppStyle.lightMulish14LightGrey,),

enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(
      color: AppColor.white,
      width: 2
  ),

  borderRadius: BorderRadius.circular(10.r),

),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r
          ),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red
          )
        ),
        focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(
            color: AppColor.white,
            width: 2
          ),

          borderRadius: BorderRadius.circular(10.r),

        ),
        focusedErrorBorder:  OutlineInputBorder(

          borderSide: BorderSide(
              color: Colors.red,
              width: 2
          ),

          borderRadius: BorderRadius.circular(10.r),

        ),
      ),

      controller: textEditingController,
        style: AppStyle.regularRubik14grey.copyWith(
          color: Colors.grey[500]
        ),
    );

  }
}
