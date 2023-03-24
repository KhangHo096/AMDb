import 'package:amdb/screens/movie_detail/movie_detail.dart';
import 'package:go_router/go_router.dart';

import '../screens/splash/splash.dart';

/// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.SPLASH,
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      name: RouteNames.MOVIE_DETAILS,
      path: '/${RouteNames.MOVIE_DETAILS}',
      builder: (context, state) => MovieDetailPage(),
    ),
  ],
);

class RouteNames {
  static const SPLASH = "splash";
  static const MOVIE_DETAILS = "movie-details";
}