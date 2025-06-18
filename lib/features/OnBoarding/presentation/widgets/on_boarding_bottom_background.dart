import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/constants/app_router.dart';
import 'package:flutter_task_internship/core/constants/cache_keys.dart';
import 'package:flutter_task_internship/core/helper/routing_helper.dart';
import 'package:flutter_task_internship/core/helper/shared_pref_helper.dart';
import 'package:flutter_task_internship/core/widgets/custom_button_core.dart';
import 'package:flutter_task_internship/features/OnBoarding/data/model/on_boarding_model.dart';
import 'package:flutter_task_internship/features/OnBoarding/presentation/widgets/on_boarding_item_builder.dart';
import 'package:flutter_task_internship/features/auth/signup/presentation/view_model/sign_up_bloc.dart';

import '../../../../core/Di/dependency_injection.dart';
import '../../../../core/constants/app_style.dart';
import '../../../../core/constants/appp_image.dart';
import '../../../auth/signup/presentation/screens/sign_up.dart';

class OnBoardingBottomBackground extends StatefulWidget {
 
  const OnBoardingBottomBackground({super.key});

  @override
  State<OnBoardingBottomBackground> createState() => _OnBoardingBottomBackgroundState();
}

class _OnBoardingBottomBackgroundState extends State<OnBoardingBottomBackground> {

  late final PageController pageController;

  int currentIndex=0;

  final List<OnBoardingModel>data=[

    OnBoardingModel(message: "all-in-one delivery "
        , description: "Order groceries, medicines, and meals delivered straight to your door"),

    OnBoardingModel(message: "User-to-User Delivery"
        , description: "Send or receive items from other users quickly and easily"),

    OnBoardingModel(message: "Sales & Discounts"
        , description: "Discover exclusive sales and deals every day"),

  ];


  @override
  void initState() {

    super.initState();

    pageController=PageController();

    pageController.addListener(() {

  currentIndex=pageController.page?.round()??0;


  },
);
  }

  @override
  void dispose() {

    super.dispose();

  pageController.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 330.h,

      child: Stack(

        children: [

          Positioned(
            bottom: 0,
            right: 0,

            child: Image.asset(
              AppImage.bottomBackground,
              height: 216.h,
              width: 216.w,
              fit: BoxFit.contain,
            ),
          ),

          buildColumn()

        ],
      ),
    );
  }

  Column buildColumn() {

    return Column(

          children: [

            SizedBox(
              height: 200.h,
              child: PageView.builder(

                controller: pageController,
                scrollDirection: Axis.horizontal
                ,itemCount: data.length,

                itemBuilder: (context, index) {

                return OnBoardingItemBuilder(onBoardingModel: data[index]);

              },),
            ),


            SizedBox(width: 295.w,height: 54.h

                ,child: CustomButtonCore(text: "GetStarted"
                    ,  onPressed: navigate
                )
            ),
            SizedBox(
              height: 5.h,
            ),

            TextButton(onPressed: (){
              const duration=Duration(
                seconds: 1
              );

if(currentIndex==data.length-1){
  navigate();
}

      else {

  pageController
      .nextPage(duration: duration, curve: Curves.linear);
}
            }, child: Text('next',style: AppStyle.regularRubik14grey,))
          ],
        );
  }

  void navigate() async{

await SharedPrefHelper.instance.saveData(key: isOnBoardingViewed, value:true);

context.pushReplacementNamed(AppRouter.login);

  }


  }

