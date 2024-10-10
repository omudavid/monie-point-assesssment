import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point_assessment/src/core/constants/app_colors.dart';
import 'package:monie_point_assessment/src/gen/assets.gen.dart';

import 'animated_arrow_slider_widget.dart';

class AnimatedAdvertsSection extends StatefulHookWidget {
  const AnimatedAdvertsSection({
    super.key,
  });

  @override
  State<AnimatedAdvertsSection> createState() => _AnimatedAdvertsSectionState();
}

class _AnimatedAdvertsSectionState extends State<AnimatedAdvertsSection> {
  double containerHeight = 0.h;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 8)).then((_) {
        setState(() {
          containerHeight = ScreenUtil().screenHeight / 2;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showCards = useState(false);
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          height: containerHeight,
          width: double.infinity,
          duration: const Duration(
            seconds: 2,
          ),
          onEnd: ()=>showCards.value=true,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                16.h,
              ),
              topLeft: Radius.circular(
                16.h,
              ),
            ),
          ),
          child: Visibility(
            visible: showCards.value,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 180.h,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        AppAssets.images.apartment1.image(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const Column(
                          children: [Spacer(),
                            AnimatedArrowSliderWidget(),
                            SizedBox(height: 10,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 180.h,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        AppAssets.images.apartment1.image(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const Column(
                          children: [Spacer(),
                            AnimatedArrowSliderWidget(),
                            SizedBox(height: 10,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


