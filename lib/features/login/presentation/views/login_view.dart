import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../../logic/cubit/auth_state.dart';
import '../../logic/data/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.only(
            top: AppSize.s250, left: AppSize.s20, right: AppSize.s20),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, AppRoutes.homeView);
            }
            else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.login,
                    style: AppStyles.regular1,
                  ),
                  SizedBox(height: AppSize.s35),
                  LoginForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
