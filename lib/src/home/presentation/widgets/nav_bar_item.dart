import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    this.selected = false,
    required this.onTap,
  });

  final SvgGenImage icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(
            selected ? 15.h : 12.h,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? AppColors.accent : AppColors.kcGray2,
          ),
          child: icon.svg(
            height: 25.h,
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
