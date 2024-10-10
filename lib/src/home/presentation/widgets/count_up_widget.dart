import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';

class CountUpWidget extends StatefulWidget {
  const CountUpWidget({super.key, this.color, required this.title});

  final Color? color;
  final String title;

  @override
  CountUpWidgetState createState() => CountUpWidgetState();
}

class CountUpWidgetState extends State<CountUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  bool showWidget = false;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController with a duration of 2 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define a Tween that goes from 1000 to 1212
    _animation = IntTween(begin: 1000, end: 1212).animate(_controller)
      ..addListener(() {
        // Call setState to update the UI when the animation changes
        setState(() {});
        if (_animation.value > 1140) {
          setState(() {
            showWidget = true;
          });
        }
      });
    Future.delayed(const Duration(seconds: 6)).then((_) {
      // Start the animation
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showWidget,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: widget.color ?? AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '${_animation.value}',
            style: TextStyle(
              color: widget.color ?? AppColors.white,
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
              color: widget.color ?? AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }
}
