import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

class AppCircleButton extends StatefulHookWidget {
  const AppCircleButton({
    super.key,
    required this.svg,
    required this.onTap,
    this.color,
    this.iconColor,
  });

  final SvgGenImage svg;
  final Function() onTap;
  final Color? color;
  final Color? iconColor;

  @override
  State<AppCircleButton> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AppCircleButton> {
  double containerHeight = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerHeight = 35.h;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      offset: Offset(-15, -80.h),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              widget.svg.svg(),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Cozy Areas",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              widget.svg.svg(),
              SizedBox(
                width: 10.w,
              ),
              Text("Price", style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              widget.svg.svg(),
              SizedBox(
                width: 10.w,
              ),
              Text("Infrastructure", style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              widget.svg.svg(),
              SizedBox(
                width: 10.w,
              ),
              Text("Without any layer", style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
      ],
      child: AnimatedContainer(
        padding: const EdgeInsets.all(10),
        height: containerHeight,
        duration: const Duration(
          seconds: 1,
        ),
        decoration: BoxDecoration(
          color: widget.color ?? AppColors.kcGray1,
          shape: BoxShape.circle,
        ),
        child: widget.svg.svg(
          fit: BoxFit.fitHeight,
          colorFilter: widget.iconColor == null
              ? null
              : ColorFilter.mode(
                  widget.iconColor!,
                  BlendMode.srcIn,
                ),
        ),
      ),
    );
  }
}
