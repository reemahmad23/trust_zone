import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../../logic/cubit/auth_state.dart';

import '../widgets/custom_button.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSize.s250),
                  Image.asset(
                    Assets.logoImage,
                    width: AppSize.s240,
                    height: AppSize.s140,
                  ),
                  SizedBox(height: AppSize.s100),
                  CustomButton(
                    label: AppStrings.login,
                    onPressedAction: () {
                      context.read<AuthCubit>().navigateToLogin();
                      Navigator.pushNamed(context, AppStrings.loginRoute);
                    },
                    backgroundColor: ColorManager.mintGreen,
                    textColor: ColorManager.black,
                    width: AppSize.s150,
                    height: AppSize.s50,
                    padding: EdgeInsets.fromLTRB(AppSize.s32, AppSize.s16, AppSize.s32, AppSize.s16),
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: AppSize.s20),
                  CustomButton(
                    label: AppStrings.signUp,
                    onPressedAction: () {
                      context.read<AuthCubit>().navigateToSignUp();
                      Navigator.pushNamed(context, AppStrings.signUpRoute);
                    },
                    backgroundColor: ColorManager.mintGreen,
                    textColor: ColorManager.black,
                    width: AppSize.s150,
                    height: AppSize.s50,
                    padding: EdgeInsets.fromLTRB(AppSize.s32, AppSize.s16, AppSize.s32, AppSize.s16),
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
