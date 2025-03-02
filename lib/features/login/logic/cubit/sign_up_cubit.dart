import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

// حالات AuthCubit
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // عملية التسجيل
  void signUp({
    required String username,
    required String email,
    required String age,
    required String disabilityType,
    required String password,
  }) {
    emit(AuthLoading());

    // محاكاة عملية التسجيل
    Future.delayed(Duration(seconds: 2), () {
      // محاكاة النجاح بعد التأخير
      if (email.isNotEmpty && password.length >= 6) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid email or password"));
      }
    });
  }

  // عملية تسجيل الدخول
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 2));

      if (email == "test@example.com" && password == "password123") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid email or password"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // التنقل لصفحة تسجيل الدخول
  void navigateToLogin() {
    emit(AuthLoginPage());
  }

  // التنقل لصفحة التسجيل
  void navigateToSignUp() {
    emit(AuthSignUpPage());
  }
}
