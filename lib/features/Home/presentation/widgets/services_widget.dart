import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/widgets/custom_shimmer.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';
import 'package:flutter_task_internship/features/Home/presentation/widgets/services_content.dart';

class ServicesWidget extends StatelessWidget {

  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 12.w
      ),
      child: BlocBuilder<HomeBloc,HomeState>(buildWhen: (previous, current) {

        return current.isServicesLoaded||current.isServicesLoading||current.isServicesError;
      },

        builder: (context, state) {

      if(state.isServicesLoading){

      return  SizedBox(
          height: 150.h,
          child: ListView.separated(separatorBuilder: (context, index) {
            return SizedBox(
              width: 12.w,
            );
          },scrollDirection: Axis.horizontal
            ,itemCount: 3
            ,itemBuilder: (context, index) {
              return Align(alignment: Alignment.centerLeft,child: CustomShimmer(width: 105.w, height: 70.h,));
            },
          ),
        );


      }
        if(state.isServicesLoaded){

          return SizedBox(
            height: 150.h,
            child: ListView.separated(separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.w,
              );
            },scrollDirection: Axis.horizontal
              ,itemCount: state.services!.length
              ,itemBuilder: (context, index) {
              return ServicesContent(
                services:state.services![index]
              );
            },
            ),
          );
        }

        if(state.isServicesError){

          return Text(state.exception.toString());

        }

        return SizedBox();
      },
      ),
    );
  }
}
