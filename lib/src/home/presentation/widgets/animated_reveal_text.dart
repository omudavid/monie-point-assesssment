import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';

class AnimatedRevealText extends StatefulHookWidget {
  const AnimatedRevealText({
    super.key,
    required this.text,
     this.delay,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final int? delay;

  @override
  State<AnimatedRevealText> createState() => _AnimatedRevealTextState();
}

class _AnimatedRevealTextState extends State<AnimatedRevealText> {
  double containerHeight = 100;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
         Duration(seconds: widget.delay?? 2),
      ).then((_) {
        setState(() {
          containerHeight = 0;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Text(
          widget.text,
          style: widget.style,
        ),
        AnimatedContainer(
          height: containerHeight,
          width: double.infinity,
          duration: const Duration(
            seconds: 2,
          ),
          decoration: BoxDecoration(
            color: AppColors.gradientStart,
          ),
        ),
      ],
    );
  }
}
