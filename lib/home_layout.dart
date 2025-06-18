import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_internship/core/Di/dependency_injection.dart';
import 'package:flutter_task_internship/features/Home/presentation/screens/home_screen_view.dart';
import 'package:flutter_task_internship/features/Home/presentation/view_model/home_bloc.dart';

import 'core/constants/app_color.dart';
import 'core/constants/app_style.dart';

class HomeLayout extends StatefulWidget {
  
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int _currentIndex = 0;

  final List<Widget> _screens = [

      BlocProvider(create: (context) {

        return getIt<HomeBloc>()
          ..add(GetProfileEvent())
          ..add(GetServices())..
           add(GetShortCuts())..
          add(GetRest());

      },child: HomeScreenView()),

    Center(child: Text('Categories')),
    Center(child: Text('Deliver')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const _CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.grid_view, 'label': 'categories'},
      {'icon': Icons.local_shipping, 'label': 'deliver'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'cart'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];

    return Container(
      padding:  EdgeInsets.only(top: 8.h, bottom: 12.h),

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {

          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                AnimatedContainer(

                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 30.w : 0,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColor.purple : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                const SizedBox(height: 6),

                Icon(
                  items[index]['icon'] as IconData,
                   size: 24.sp,
                  color: isActive ? AppColor.purple : Colors.black,
                ),

                const SizedBox(height: 4),

                Text(
                  items[index]['label'] as String,
                  style: isActive?AppStyle.regularPoppins12Purple:AppStyle.regularPoppins12Purple.copyWith(
                    color: Colors.black
                  )
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
