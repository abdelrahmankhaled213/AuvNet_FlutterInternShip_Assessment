import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/features/auth/login/presentation/widgets/login_form.dart';

import '../../../signup/presentation/widgets/Nawel_logo.dart';

class LoginScreenView extends StatelessWidget {

  const LoginScreenView({super.key});

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
                  child: LoginForm()
              ),


            ],

          )
      ),
    );

  }
}
