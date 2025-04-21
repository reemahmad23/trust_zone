import 'package:flutter/material.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/login/presentation/views/forgot_password_view.dart';
import '../features/login/presentation/views/login_view.dart';
import '../features/login/presentation/views/logo_view.dart';
import '../features/login/presentation/views/sign_up_view.dart';

class AppRoutes {
  static const String logoView = "/";
  static const String loginView = "/login";
  static const String signUpView = "/signup";
  static const String homeView = "/home";
  static const String forgotPasswordView = '/forgotPassword';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logoView:
        return MaterialPageRoute(builder: (_) => LogoView());
      case loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case signUpView:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case forgotPasswordView:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
