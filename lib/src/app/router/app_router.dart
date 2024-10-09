// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/home_page.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/likes_page.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/main_page.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/message_page.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/profile_page.dart';
import 'package:monie_point_assessment/src/home/presentation/pages/search_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: SearchRoute.page,
            ),
            AutoRoute(
              page: MessageRoute.page,
            ),
            AutoRoute(
              page: LikesRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
