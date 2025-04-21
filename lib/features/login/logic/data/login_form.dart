import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../../presentation/widgets/custom_button.dart';
import '../../presentation/widgets/custom_text_field.dart';
import '../cubit/auth_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.pleaseEnterYourEmail;
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.invalidEmailFormat;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.pleaseEnterYourPassword;
    }
    if (value.length < 6) {
      return "Password is too short (min: 6 characters)";
    }
    if (value.length > 16) {
      return "Password is too long (max: 16 characters)";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: TextStyle(color: ColorManager.error),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                labelText: AppStrings.email,
                validator: validateEmail,
              ),
              SizedBox(height: AppSize.s20),
              CustomTextField(
                controller: passwordController,
                labelText: AppStrings.password,
                isPassword: true,
                validator: validatePassword,
              ),
              SizedBox(height: AppSize.s10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPasswordView,
                      ),
                  child: Text(
                    AppStrings.forgotPassword,
                    style: AppStyles.subText,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s20),
              state is AuthLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                    label: AppStrings.login,
                    onPressedAction: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    backgroundColor: ColorManager.mintGreen,
                    textColor: ColorManager.black,
                    width: double.infinity,
                  ),
              SizedBox(height: AppSize.s40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.dontHaveAccount, style: AppStyles.subText),
                  GestureDetector(
                    onTap:
                        () =>
                            Navigator.pushNamed(context, AppRoutes.signUpView),
                    child: Text(AppStrings.signUp, style: AppStyles.subText),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
