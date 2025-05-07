import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/domain/entities/category_entity.dart';
import 'package:trust_zone/features/home/domain/entities/place_entity.dart';
import 'package:trust_zone/features/home/domain/repo/place_repo.dart';
import 'package:trust_zone/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/features/home/presentation/views/branch_details.dart';
import 'package:trust_zone/features/home/presentation/views/edit_profile_view.dart';
import 'package:trust_zone/features/home/presentation/views/home_view.dart';
import 'package:trust_zone/features/home/presentation/views/places_view.dart';
import 'package:trust_zone/features/home/presentation/views/profile_view.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
        return BlocProvider<CategoryCubit>(
        create: (context) => sl<CategoryCubit>()..fetchCategories(),
        child: const HomeView(),
      );
  },

),

 GoRoute(
      path: '/places-view',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        final int categoryId = extra['id'];
        final String categoryName = extra['name'];

        return PlacesView(
          categoryId: categoryId,
          categoryName: categoryName,
        );
      },
    ),

  GoRoute(
  path: '/branch-details',
  builder: (context, state) {
    final extra = state.extra as Map;
    final branch = extra['branch'] as Branch;
    return BranchDetailPage(branch: branch);
  },
),




      GoRoute(
      path: '/profile-view',
      builder: (context, state) => BlocProvider(
        create: (context) => sl<ProfileCubit>()..fetchUserProfile(),
        child: const ProfileView(),
      ),
    ),


    

    
    GoRoute(
      path: '/editProfile',
      builder: (context, state) => BlocProvider.value(
        value: sl<ProfileCubit>(),
        child: const EditProfileView(),
      ),
    ),
    ],
  );
}
