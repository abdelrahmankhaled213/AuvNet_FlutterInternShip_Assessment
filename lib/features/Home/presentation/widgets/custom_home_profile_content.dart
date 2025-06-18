import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';

class CustomHomeProfileContent extends StatelessWidget {

  final ProfileEntity profileEntity;

  const CustomHomeProfileContent({super.key, required this.profileEntity});


  @override
  Widget build(BuildContext context) {

    return Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

Text("Hi ${profileEntity.name} !",style: AppStyle.boldRubik30White,),

        CircleAvatar(
          radius: 40.r, // Increase radius
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: profileEntity.image,
              width: 80.w, // radius * 2
              height: 80.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(
                Icons.error_outline,
                size: 30.sp, // Adjust icon size for bigger avatar
              ),
            ),
          ),
        ),

      ],
    );
  }
}
