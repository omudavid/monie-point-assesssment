import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/animated_adverts_section.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/animated_app_bar.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/animated_reveal_text.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/buy_rent_section.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.6,
                0.8,
              ],
              colors: [
                AppColors.gradientStart,
                AppColors.gradientEnd,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AnimatedAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      AnimatedRevealText(
                        text: 'Hi, Marina',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.accentText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AnimatedRevealText(
                        text: 'let\'s select your \nperfect place',
                        delay: 4,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BuyRentSection(),
                const Expanded(
                  child: AnimatedAdvertsSection(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
