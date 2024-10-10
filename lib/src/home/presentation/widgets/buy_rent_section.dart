import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';

import 'count_up_widget.dart';

class BuyRentSection extends StatefulHookWidget {
  const BuyRentSection({super.key});

  @override
  State<BuyRentSection> createState() => _BuyRentSectionState();
}

class _BuyRentSectionState extends State<BuyRentSection> {
  double rentSized = 1.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 6),
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
    return SizedBox(
      height: (ScreenUtil().screenWidth / 2) - 20.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            AnimatedContainer(
              width: rentSized,
              height: rentSized,
              duration: const Duration(
                seconds: 1,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: CountUpWidget(
                  title: 'Buy',
                ),
              ),
            ),
            const Spacer(),
            AnimatedContainer(
              width: rentSized,
              height: rentSized,
              duration: const Duration(
                seconds: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.white,
              ),
              onEnd: () => showText.value = true,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CountUpWidget(
                  title: 'Rent',
                  color: AppColors.accentText,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
