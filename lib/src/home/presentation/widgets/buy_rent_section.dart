import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';

class BuyRentSection extends StatefulHookWidget {
  const BuyRentSection({super.key});

  @override
  State<BuyRentSection> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<BuyRentSection> {
  double rentSized = 1.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 4),
      ).then((_) {
        setState(() {
          rentSized = (ScreenUtil().screenWidth / 2) - 20.w;
        });
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
            width: rentSized,
            height: rentSized,
            duration: const Duration(
              seconds: 2,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (showText.value) ...[
                      Text(
                        'BUY',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '2 212',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Offers',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ]),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          AnimatedContainer(
            width: rentSized,
            height: rentSized,
            duration: const Duration(
              seconds: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.white,
            ),
            onEnd: () => showText.value = true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (showText.value) ...[
                    Text(
                      'Rent',
                      style: TextStyle(
                        color: AppColors.accentText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '2 212',
                      style: TextStyle(
                        color: AppColors.accentText,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Offers',
                      style: TextStyle(
                        color: AppColors.accentText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
