import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../../logic/cubit/auth_state.dart';
import '../../logic/data/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.all(AppSize.s20),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, AppRoutes.homeView);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up", style: AppStyles.regular1),
                  SizedBox(height: AppSize.s40),
                  SignUpForm(),
                  SizedBox(height: AppSize.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppStyles.subText,
                      ),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              AppRoutes.loginView,
                            ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
