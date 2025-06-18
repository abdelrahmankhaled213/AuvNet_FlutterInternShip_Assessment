import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_color.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/core/helper/font_weight_helper.dart';
import 'package:flutter_task_internship/features/Home/Data/model/Services.dart';

class ServicesContent extends StatelessWidget {

  final Services services;

  const ServicesContent({super.key,required this.services});

  @override
  Widget build(BuildContext context) {

    return _buildServicesColumn();

  }
  Widget _buildServicesColumn() {
    return Column(
      children: [

_buildServicesContainerImage(),
?_buildServicesContainerDiscountOrDelivery(),

SizedBox(
height: 5.h,
),

buildText()
      ],
    );
  }

Widget _buildServicesContainerImage(){
    return  Container(
      height: 70.h,
      width: 105.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 4),
            spreadRadius: 5,
            blurRadius: 12,
          )
        ],
      ),
      padding: EdgeInsets.all(12.r), // Optional: add spacing around the image
      child: Center(
        child: CachedNetworkImage(
          imageUrl: services.image,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 40.sp,
            color: Colors.red,
          ),
          placeholder: (context, url) => CircularProgressIndicator(), // Optional
          fit: BoxFit.cover,
        ),
      ),
    );

}

  Widget? _buildServicesContainerDiscountOrDelivery() {
    final delivery = services.delivery;
    final discount = services.discount;

    // Return null if both are null
    if (delivery == null && discount == null) {
      return null;
    }

    // Build display text based on available data
    final displayText = delivery != null
        ? "$delivery min"
        : "Up to ${discount}%";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColor.purple,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        displayText,
        style: AppStyle.boldDmSans14blue.copyWith(
          color: Colors.white,
          fontSize: 8.sp,
        ),
      ),
    );
  }

Widget buildText(){

    return SizedBox(
      height: 40.h,
      width: 100.w,

      child: Center(
        child: Text(textAlign: TextAlign.center,maxLines: 2,services.name,style: AppStyle.boldDmSans14blue.copyWith(
          fontWeight: FontWeightHelper.medium,

          color: AppColor.black,
          fontSize: 12.sp
        ),),
      ),
    );
}
}