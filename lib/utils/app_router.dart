import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/home_view.dart';
import 'package:trust_zone/features/home/presentation/views/places_view.dart';
import 'package:trust_zone/features/home/presentation/views/profile_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomeView(),
      ),

      GoRoute(
      path: '/places-view',
      builder: (context, state) =>  PlacesView(),
      ),
      GoRoute(
      path: '/profile_view',
      builder: (context, state) =>  ProfileView(),
      ),
    

    //   GoRoute(
    //   path: '/',
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => sl<ProfileCubit>()..fetchUserProfile(),
    //     child: const ProfileView(),
    //   ),
    // ),
    // GoRoute(
    //   path: '/editProfile',
    //   builder: (context, state) => BlocProvider.value(
    //     value: sl<ProfileCubit>(),
    //     child: const EditProfileView(),
    //   ),
    // ),
    ],
  );
}
