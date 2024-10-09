import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

import 'nav_bar_item.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({
    super.key,
    required this.tabsRouter,
    required this.notifier,
  });

  final TabsRouter tabsRouter;
  final ValueChanged<int> notifier;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );


    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));


    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        height: 70.h,
        margin: EdgeInsets.only(
          bottom: 30.h,
          left: 20.w,
          right: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.kcGray1,
          borderRadius:BorderRadius.circular(35)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              icon: AppAssets.icons.search,
              onTap: () => _setActiveIndex(0, context),
              selected: widget.tabsRouter.activeIndex == 0,
            ),
            NavBarItem(
              icon: AppAssets.icons.message,
              onTap: () => _setActiveIndex(1, context),
              selected: widget.tabsRouter.activeIndex == 1,
            ),
            NavBarItem(
              icon: AppAssets.icons.home,
              onTap: () => _setActiveIndex(2, context),
              selected: widget.tabsRouter.activeIndex == 2,
            ),
            NavBarItem(
              icon: AppAssets.icons.heart,
              onTap: () => _setActiveIndex(3, context),
              selected: widget.tabsRouter.activeIndex == 3,
            ),
            NavBarItem(
              icon: AppAssets.icons.profile,
              onTap: () => _setActiveIndex(4, context),
              selected: widget.tabsRouter.activeIndex == 4,
            ),
          ],
        ),
      ),
    );
  }

  ///
  void _setActiveIndex(final index, BuildContext context) {
    if (widget.tabsRouter.activeIndex == index) {
      return;
    }
    widget.tabsRouter.setActiveIndex(index);
  }
}
