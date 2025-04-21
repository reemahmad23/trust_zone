import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/profile_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const ProfileView(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb25pYTEyMyIsImp0aSI6IjJmNWI2MjJkLWRjNWQtNDBlZS1hZTUwLWYxMDgzOWNkNmMxNiIsIlVpZCI6IjU3NTBhNWNhLWQ4MDctNGExMC04ZDYwLTc1NDg2NmZjODcyZCIsInJvbGVzIjoiVXNlciIsImV4cCI6MTc0Nzg1Mzc4OCwiaXNzIjoiVHJ1c3Rab25lIiwiYXVkIjoiVHJ1c3Rab25lVXNlciJ9.2VzM558dhp7-ia_o3v2FevStIPg8_8hHybK2kmjDiJk',)),
    ],
  );
}
