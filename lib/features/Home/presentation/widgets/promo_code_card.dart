import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/appp_image.dart';
import 'package:flutter_task_internship/core/helper/font_weight_helper.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class PromoCodeCard extends StatelessWidget {

  const PromoCodeCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w
      ),
      child: SizedBox(
        height: 100.h,
        width: 343.w,
        child: Card(

          color: Colors.white,
          elevation: 13.sp,
          shadowColor: Colors.grey[200],
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: AppColor.white
            )
          ),
          child: _buildCardContent(),
        ),
      ),
    );

  }

}

Widget _buildCardContent(){
  return Row( 
    children: [ 
    Image.asset(AppImage.promoCode,height: 78.9.h,width: 80.w,) ,
    SizedBox(
      width: 8.w,
    )  ,
     _buildCardColumn()
    ],
  );

}

Widget _buildCardColumn(){

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Got a code !",style: AppStyle.boldDmSans14blue.copyWith(
        color: AppColor.black
      ),),

      SizedBox(
        height: 6.h,
      ),

      SizedBox(
        width: 170.w,
        height: 32.h,
        child: Text("Add your code and save on your order",style: AppStyle.boldDmSans14blue.copyWith(
fontSize: 10.sp,
          color: Colors.grey[400],
          fontWeight: FontWeightHelper.medium,

        ),),
      )
    ],
  );
}