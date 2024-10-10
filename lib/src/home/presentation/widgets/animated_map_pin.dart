import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

class AnimatedMapPin extends StatefulHookWidget {
  const AnimatedMapPin({
    super.key,
    required this.svg,
    required this.onTap,
  });

  final SvgGenImage svg;
  final Function() onTap;

  @override
  State<AnimatedMapPin> createState() => _AnimatedMapPinState();
}

class _AnimatedMapPinState extends State<AnimatedMapPin> {
  double containerWidth = 20.h;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        containerWidth = 80.h;
      });
      Future.delayed(const Duration(seconds: 3)).then((_) {
        setState(() {
          containerWidth = 60.h;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showText = useState(false);
    final showIcon = useState(false);
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      height: 40.h,
      width: containerWidth,
      duration: const Duration(
        seconds: 1,
      ),
      onEnd: () {
        if (containerWidth == 80.h) {
          showText.value = true;
        } else if (containerWidth == 60.h) {
          showText.value = false;
          showIcon.value = true;
        }
      },
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            16.h,
          ),
          topLeft: Radius.circular(
            16.h,
          ),
          bottomRight: Radius.circular(
            16.h,
          ),
        ),
      ),
      child: Stack(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Visibility(
              visible: showIcon.value,
              child: widget.svg.svg(
                // fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Center(
            child: Visibility(
              visible: showText.value,
              child: Text(
                'Lagos',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
