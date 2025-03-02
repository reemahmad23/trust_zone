import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_router.dart';

void main() {
  runApp(const TrustZone());
}

class TrustZone extends StatelessWidget {
  const TrustZone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
      