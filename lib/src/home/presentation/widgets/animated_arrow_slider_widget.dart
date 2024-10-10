import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedArrowSliderWidget extends StatefulWidget {
  const AnimatedArrowSliderWidget({super.key});

  @override
  AnimatedArrowSliderWidgetState createState() => AnimatedArrowSliderWidgetState();
}

class AnimatedArrowSliderWidgetState extends State<AnimatedArrowSliderWidget> {
  bool _isMoved = false;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Future.delayed(const Duration(seconds: 6)).then((_) {
      setState(() {
        _isMoved = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: SizedBox(
        height: 60,
        child: Stack(
          children: [
            // Background container
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              child: const Center(
                child: Text(
                  'Gladkova St., 25',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // Circle moving animation
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              right: _isMoved ? 10 : 290,
              // Change this value to adjust the range of movement
              top: 10,
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(
                  left: 100.w,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}