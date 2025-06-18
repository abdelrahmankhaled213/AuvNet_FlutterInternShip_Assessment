import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/features/auth/signup/presentation/widgets/sign_up_form.dart';

import '../widgets/Nawel_logo.dart';

class SignUpScreenView extends StatelessWidget {

  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
          child: CustomScrollView(

            slivers: [

              SliverToBoxAdapter(
                child: SizedBox(

                  height: 20.h,

                ),
              ),

              SliverToBoxAdapter(
                child: NawelLogo()
              ),
              SliverToBoxAdapter(
                child: SizedBox(

                  height: 40.h,

                ),
              ),

              SliverToBoxAdapter(
                  child: SignUpForm()
              ),


            ],

      )
      ),
    );

  }
}
