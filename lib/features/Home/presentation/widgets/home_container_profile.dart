import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/widgets/custom_shimmer.dart';
import 'package:flutter_task_internship/features/Home/Domain/Entity/profile_entity.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_style.dart';
import 'custom_home_profile_content.dart';

class HomeContainerProfile extends StatelessWidget {

  const HomeContainerProfile({super.key,});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context, state) {

         if(state.isProfileLoading){

          return CustomShimmer(

            height: 156.h,
            width: double.infinity,

         );
        }

        if(state.isProfileLoaded){
          
       return
          Container(
padding: EdgeInsets.symmetric(
  vertical:8.h,
  horizontal: 15.w
),
    height: 156.h,

    decoration: BoxDecoration(

    borderRadius: BorderRadius.only(

    bottomLeft:Radius.circular(30.r),

    bottomRight: Radius.circular(30.r)

    ),

    gradient: LinearGradient(
    colors:

    [
    AppColor.yellow,
    AppColor.purple,
    ],

    stops: [0.0,1],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,

    )
    ),
    child:CustomHomeProfileContent(
    profileEntity: state.profileEntity??ProfileEntity(image: "", name:""),
    )
    );
       
        }
        
        if(state.isProfileError){

          return Center(child: Text(state.exception.toString(),style: AppStyle.mediumRubik28Black));
        }
        return SizedBox.shrink();
      },
      buildWhen: (previous, current) => current.isProfileError||current.isProfileLoading
          ||current.isProfileLoaded);
      
  }
}
