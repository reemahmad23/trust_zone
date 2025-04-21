import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:trust_zone/features/home/data/models/profile_model/disability_type.dart';
import 'package:trust_zone/features/home/data/models/profile_model/profile_model.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:trust_zone/utils/get_token.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';
import 'package:trust_zone/utils/simple_bloc_observer.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();

  Hive.registerAdapter(DisabilityTypeAdapter());
  Hive.registerAdapter(ProfileModelAdapter());


  await Hive.openBox("profileBox");
  
  final token = await getTokenFromSharedPreferences();

  setupServiceLocator(token);
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => const TrustZone(),
  )
  );
}
  // class TrustZone extends StatelessWidget {
  // const TrustZone({super.key});

  // @override
  // Widget build(BuildContext context) {
  // return MultiBlocProvider(
  // providers: [
  // BlocProvider(create: (context) => AuthCubit()),
  // BlocProvider(create: (context) => LoginCubit()),
  // ],
  // child: MaterialApp(
  // title: 'Flutter Clean Architecture',
  // initialRoute: AppRoutes.logoView,
  // onGenerateRoute: AppRoutes.generateRoute,
  // ),
  // );
  // }
  // }

final getIt = GetIt.instance;
class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        ],
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}





