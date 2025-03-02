import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/places_view.dart';

abstract class AppRouter {
  static final  router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const PlacesView(),

    ),
  ]
  );
}