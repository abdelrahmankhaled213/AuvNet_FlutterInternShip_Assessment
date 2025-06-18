import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/helper/flutter_toast.dart';
import 'package:flutter_task_internship/core/widgets/custom_shimmer.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';
import 'package:flutter_task_internship/features/Home/presentation/widgets/shortcut_content.dart';

class ShortCutWidget extends StatelessWidget {

  const ShortCutWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsetsGeometry.symmetric(
        horizontal: 12.w
    ),
      child: BlocConsumer<HomeBloc,HomeState>(

        buildWhen: (previous, current) {

        return current.isShortCutLoading || current.isShortCutLoaded;
      },
        builder: (context, state) {

        if(state.isShortCutLoading){

          return SizedBox(
            height: 100.h,
            child: ListView.separated(separatorBuilder: (context, index) {
            return SizedBox(
              width: 12.w,
            );
                          },scrollDirection: Axis.horizontal
            ,itemCount: 4
            ,itemBuilder: (context, index) {
              return Align(alignment: Alignment.centerLeft,child: CustomShimmer(width: 65.w, height: 80.h));
            },
                          ),
          );

        }

        if(state.isShortCutLoaded){

          return SizedBox(
            height: 100.h,
            child: ListView.separated(separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.w,
              );
            },scrollDirection: Axis.horizontal
              ,itemCount: state.shortcuts!.length
              ,itemBuilder: (context, index) {
                return ShortcutContent(
                  shortCuts: state.shortcuts![index],
                );
              },
            ),
          );

        }

        return SizedBox.shrink() ;

        }, listener: (BuildContext context, HomeState state) {

          FlutterToastHelper.instance.showToast(message: "Check internet connection",color: Colors.red);
      },
        listenWhen: (previous, current) {
          return current.isShortCutError;
        },

      ),
    );

  }

}
