import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/animated_app_button.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/animated_map_pin.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/app_circle_button.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/custom_text_field.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppAssets.images.darkMap.image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const CustomTextField(),
                      const Spacer(),
                      AppCircleButton(
                        svg: AppAssets.icons.option,
                        color: AppColors.white,
                        iconColor: AppColors.black,
                        onTap: () {},
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            right: 30,
                            child: AnimatedMapPin(
                              svg: AppAssets.icons.locationPin,
                              onTap: () {},
                            ),
                          ),Positioned(
                            bottom: 20,
                            left: 30,
                            child: AnimatedMapPin(
                              svg: AppAssets.icons.locationPin,
                              onTap: () {},
                            ),
                          ),Positioned(
                            top: 60,
                            right: 50,
                            child: AnimatedMapPin(
                              svg: AppAssets.icons.locationPin,
                              onTap: () {},
                            ),
                          ), Positioned(
                            top: 65,
                            left: 0,
                            child: AnimatedMapPin(
                              svg: AppAssets.icons.locationPin,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          AppCircleButton(
                            svg: AppAssets.icons.stack,
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppCircleButton(
                            svg: AppAssets.icons.location,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      AnimatedAppButton(
                        svg: AppAssets.icons.list,
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 110.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
