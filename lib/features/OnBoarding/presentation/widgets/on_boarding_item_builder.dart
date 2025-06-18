import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/features/OnBoarding/data/model/on_boarding_model.dart';

import '../../../../core/constants/app_style.dart';

class OnBoardingItemBuilder extends StatelessWidget {

  final OnBoardingModel onBoardingModel;

  const OnBoardingItemBuilder({super.key,required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Text(onBoardingModel.message,style: AppStyle.mediumRubik28Black,)

        ,SizedBox(
          height: 5.h,
        ),


        Align(alignment: Alignment.topCenter
            ,child: SizedBox(

              height: 70.h,
              width: 289.w,

              child: Text(maxLines: 2,onBoardingModel.description
                ,style: AppStyle.regularRubik14grey,textAlign: TextAlign.center,),
            )),



      ],
    );
  }
}
