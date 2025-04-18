import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/utils/app_router.dart';
import 'package:trust_zone/utils/app_routes.dart';
import 'features/login/logic/cubit/auth_state.dart';
import 'features/login/logic/cubit/login_cubit.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => const TrustZone(),
  ));
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

class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}





