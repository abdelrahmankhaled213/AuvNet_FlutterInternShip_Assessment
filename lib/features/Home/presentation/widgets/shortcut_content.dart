import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/helper/font_weight_helper.dart';
import 'package:flutter_task_internship/features/Home/Data/model/shortcuts.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';

class ShortcutContent extends StatelessWidget {

  final ShortCuts shortCuts;

  const ShortcutContent({super.key,required this.shortCuts});

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        _buildContainer(),
        SizedBox(
          height: 4.h,
        ),
        Text(shortCuts.name,style: AppStyle.boldDmSans14blue.copyWith(
          color: AppColor.black,
          fontWeight: FontWeightHelper.medium,
          fontSize: 12.sp
        ),)
    ]
    );
  }

  Widget _buildContainer(){
    return Container(

      height: 65.h,
      width: 65.w,
      decoration: BoxDecoration(
        color: AppColor.rose,
        borderRadius: BorderRadius.circular(10.r),

      ),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: shortCuts.image,
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
}
