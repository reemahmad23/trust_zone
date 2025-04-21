import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String username,
    required String email,
    required String age,
    required String disabilityType,
    required String password,
  }) {
    emit(AuthLoading());

    Future.delayed(Duration(seconds: 2), () {
      if (email.isNotEmpty && password.length >= 6) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid email or password"));
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 2));

      if (email == "shimaarabeay2@gmail.com" && password == "2244668800") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid email or password"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void navigateToLogin() {
    emit(AuthLoginPage());
  }

  void navigateToSignUp() {
    emit(AuthSignUpPage());
  }
}
