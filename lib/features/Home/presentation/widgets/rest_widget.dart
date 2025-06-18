import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/core/helper/font_weight_helper.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/rest_entity.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../view_model/home_bloc.dart';

class RestWidget extends StatelessWidget {

  const RestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
          horizontal: 12.w
      ),
      child: BlocBuilder<HomeBloc,HomeState>(buildWhen: (previous, current) {

        return current.isRestLoading||current.isRestLoaded;
      },

        builder: (context, state) {

          if(state.isRestLoading){

            return SizedBox(
              height: 150.h,
              child: ListView.separated(separatorBuilder: (context, index) {

                return SizedBox(
                  width: 12.w,
                );
              },scrollDirection: Axis.horizontal
                ,itemCount: 4
                ,itemBuilder: (context, index) {

                  return Align(alignment: Alignment.centerLeft,child: CustomShimmer(width:80.w , height: 70.h));

                },
              ),
            );

          }

          if(state.isRestLoaded){

            return SizedBox(
              height: 150.h,
              child: ListView.separated(separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.w,
                );
              },scrollDirection: Axis.horizontal
                ,itemCount: state.rest!.length
                ,itemBuilder: (context, index) {

                  return _buildContainerRest(state.rest![index]);
                },
              ),
            );
          }


          return SizedBox();
        },
      ),
    );
  }

  Widget _buildContainerRest(RestEntity restEntity){

    return Column(
      children: [
   
        _buildContainer(restEntity),

        SizedBox(
          height: 5.h,
        ),
        Text(restEntity.name,style: AppStyle.boldDmSans14blue.copyWith(
          color: AppColor.black,
          fontSize: 12.sp,
          fontWeight: FontWeightHelper.medium
        ),),

        SizedBox(height: 2.h,),

        Text("${restEntity.delvieryTime} min",style: AppStyle.boldDmSans14blue.copyWith(
            color: AppColor.black,
            fontSize: 10.sp,
            fontWeight: FontWeightHelper.regular
        ),
        ),

      ]
    );

  }

 Widget _buildContainer(RestEntity restEntity){
    return Stack(
     children: [

       Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              shape: BoxShape.rectangle
          ),

          height: 70.h,
          width: 80.w,
          child: Center(

            child: CachedNetworkImage(
              imageUrl: restEntity.image,
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: 40.sp,
                color: Colors.red,
              ),
              placeholder: (context, url) => CircularProgressIndicator(), // Optional
              fit: BoxFit.cover,
            ),
          )
      ),

       if (!restEntity.isOpen) ...[
         Positioned.fill(
           child: ClipRRect(
             borderRadius: BorderRadius.circular(0), // Match the image
             child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 4.5, sigmaY: 4.5),
               child: Container(
                 color: Colors.black.withOpacity(0.4), // Dim overlay
                 alignment: Alignment.center,
                 child: Text(
                   'Closed',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 14.sp,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
           ),
         ),
       ],
     ],
    );




 }
}
