import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/features/OnBoarding/presentation/widgets/nawel_background_stack.dart';
import 'package:flutter_task_internship/features/OnBoarding/presentation/widgets/on_boarding_bottom_background.dart';

class OnBoardingView extends StatelessWidget {

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(child: OnBoardingBackgroundStack()),

          SliverToBoxAdapter(child: SizedBox(
height: 20.h,
          )
          ),
          SliverToBoxAdapter(

            child: OnBoardingBottomBackground()
          )

        ],
      )
    );


  }
}