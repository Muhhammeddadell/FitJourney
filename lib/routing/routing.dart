import 'package:go_router/go_router.dart';
import 'package:workout_application/exercieses.dart';
import 'package:workout_application/presentation/screens/profile.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';
import 'package:workout_application/presentation/screens/home/landing_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const landingPage(),
      routes: [
        GoRoute(
          path: "/home",
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              path: "/profile",
              builder: (context, state) => Profilepage(),
              routes: [
                GoRoute(
                  path: "/ex",
                  builder: (context, state) => oExercieses(),
                )
              ],
            )
          ],
        )
      ],
    )
  ],
);
