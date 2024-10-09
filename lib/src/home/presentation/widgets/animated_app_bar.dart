import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

class AnimatedAppBar extends StatefulHookWidget {
  const AnimatedAppBar({super.key});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double profileHeight = 1.0;
  double textFieldWidth = 1.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        profileHeight = 40.h;
        textFieldWidth = 180.w;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showText = useState(false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            width: textFieldWidth,
            height: 40.h,
            duration: const Duration(
              seconds: 2,
            ),
            onEnd: () {
              showText.value = true;
            },
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.h / 2)),
            child: Visibility(
              visible: showText.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppAssets.icons.locationPin.svg(
                    height: 15.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.accentText,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    ' Saint Petersberg',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.accentText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(profileHeight / 2),
            child: AnimatedContainer(
              height: profileHeight,
              duration: const Duration(
                seconds: 2,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: AppAssets.images.profileImage.image(
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
