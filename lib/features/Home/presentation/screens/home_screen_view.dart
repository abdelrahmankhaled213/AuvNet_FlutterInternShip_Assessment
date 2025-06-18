import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_style.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';
import 'package:flutter_task_internship/features/Home/presentation/widgets/home_container_profile.dart';
import 'package:flutter_task_internship/features/Home/presentation/widgets/rest_widget.dart';

import '../../../../core/constants/app_color.dart';
import '../widgets/promo_code_card.dart';
import '../widgets/services_widget.dart';
import '../widgets/shortcuts_widget.dart';

class HomeScreenView extends StatelessWidget {

  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: CustomScrollView(

            slivers: [

              SliverToBoxAdapter(

                child: HomeContainerProfile(
                ),

              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 6.h,
                ),
              ),

              SliverToBoxAdapter(
                child:Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w
                  ),
                  child: Text('Services',style: AppStyle.boldDmSans14blue.copyWith(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  ),),
                ) ,
              ),


              SliverToBoxAdapter(

                child: SizedBox(
                  height: 15.h,
                ),
              ),

              SliverToBoxAdapter(
                child: ServicesWidget(),
              ),


              SliverToBoxAdapter(

                child: SizedBox(
                  height: 8.h,
                ),
              ),

              SliverToBoxAdapter(

                child: PromoCodeCard()

              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 8.h,
                ),
              ),

              SliverToBoxAdapter(
   child:  Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 22.w
    ),
                  child: Text("Shortcuts",style: AppStyle.boldDmSans14blue.copyWith(
                    color: AppColor.black,
                    fontSize: 20.sp,
                  ),)

              ),

              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 8.h,
                ),
              ),

              SliverToBoxAdapter(

                child: ShortCutWidget()
              ),


              SliverToBoxAdapter(

                child: SizedBox(
                  height: 8.h,
                ),
              ),

              SliverToBoxAdapter(

    child:  Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 12.w,
    ),
                child: Text("Popular restaurants nearby",style: AppStyle.boldDmSans14blue.copyWith(
                  color: AppColor.black,
                  fontSize: 16.sp
                ),)
    )
              ),
              SliverToBoxAdapter(

                child: SizedBox(
                  height: 12.h,
                ),
              ),

              SliverToBoxAdapter(

                  child: RestWidget()
              ),


            ],
          ),
    );

  }
}
