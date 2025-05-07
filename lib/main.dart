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

class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      
    );
  }
}





