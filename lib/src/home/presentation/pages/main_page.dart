import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monie_point_assessment/src/app/router/app_router.dart';
import 'package:monie_point_assessment/src/home/presentation/widgets/custom_bottom_nav.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        SearchRoute(),
        MessageRoute(),
        HomeRoute(),
        LikesRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Stack(
          children: [
            Scaffold(
              body: child,
            ),
            Column(
              children: [
                const Spacer(),
                CustomBottomNav(
                  tabsRouter: tabsRouter,
                  notifier: (int value) {},
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
