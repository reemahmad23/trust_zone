import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم
  setupServiceLocator(); 
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

class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    // MultiBlocProvider(
    //   providers: [
    //     // ProfileCubit يتم تحميله باستخدام GetIt
    //     BlocProvider(
    //       create: (_) => getIt<ProfileCubit>()..getUserProfile(),
    //     ),
    //     // ممكن تضيف Cubits تانية هنا
    //   ],
    //   child:
      MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      
    );
  }
}





