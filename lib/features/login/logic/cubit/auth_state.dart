import 'package:flutter_bloc/flutter_bloc.dart';
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {}
class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
class AuthLoginPage extends AuthState {}
class AuthSignUpPage extends AuthState {}
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
    try {
      if (email.isNotEmpty && password.length >= 6) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid email or password"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }


  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {

      await Future.delayed(Duration(seconds: 2));

      if (email == "test@example.com" && password == "password123") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure( "Invalid email or password"));
      }
    } catch (e) {
      emit(AuthFailure( e.toString()));
    }
  }
  void navigateToLogin() {
    emit(AuthLoginPage());
  }
  void navigateToSignUp() {
    emit(AuthSignUpPage());
  }
}