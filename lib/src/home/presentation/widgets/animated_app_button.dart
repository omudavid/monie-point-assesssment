import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

class AnimatedAppButton extends StatefulHookWidget {
  const AnimatedAppButton({
    super.key,
    required this.svg,
    required this.onTap,
  });

  final SvgGenImage svg;
  final Function() onTap;

  @override
  State<AnimatedAppButton> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppButton> {
  double containerHeight = 20.h;
  double containerWidth = 20.h;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerHeight = 35.h;
        containerWidth = 150.h;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showText = useState(false);
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      height: containerHeight,
      width: containerWidth,
      duration: const Duration(
        seconds: 1,
      ),
      onEnd: ()=>showText.value=true,
      decoration: BoxDecoration(
        color: AppColors.kcGray1,
        borderRadius: BorderRadius.circular(
          16.h,
        ),
      ),
      child: Row(
        children: [
          widget.svg.svg(
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          Visibility(
            visible: showText.value,
            child: Text(
              'List of variants',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
