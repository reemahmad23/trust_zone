import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../../presentation/widgets/custom_button.dart';
import '../../presentation/widgets/custom_text_field.dart';
import '../cubit/auth_state.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController disabilityTypeController =
  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        ageController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username cannot be empty";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select your birthdate";
    }
    return null;
  }


  String? validateDisabilityType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Disability Type cannot be empty";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password is too short (min: 6 characters)";
    }
    if (value.length > 16) {
      return "Password is too long (max: 16 characters)";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: usernameController,
            labelText: "Username",
            validator: validateUsername,
          ),
          SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: emailController,
            labelText: "Email",
            validator: validateEmail,
          ),
          SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: ageController,
            labelText: "Age",
            validator: validateAge,
            suffixIcon: IconButton(
              icon: Image.asset(
                'assets/images/Icon_calendar.jpg',
                height: 20,
                width: 20,
                color: Colors.grey,
              ),
              onPressed: _selectDate,
            ),
          ),

          // CustomTextField(
          //   controller: ageController,
          //   labelText: "Age",
          //   validator: validateAge,
          //   suffixIcon: IconButton(
          //     icon: Icon(
          //       Icons.calendar_today,
          //       color: Colors.grey,
          //     ),
          //     onPressed: _selectDate,
          //   ),),
          SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: disabilityTypeController,
            labelText: "Disability Type",
            validator: validateDisabilityType,
          ),
          SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: passwordController,
            labelText: "Password",
            isPassword: true,
            validator: validatePassword,
          ),
          SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: confirmPasswordController,
            labelText: "Confirm Password",
            isPassword: true,
            validator: validateConfirmPassword,
          ),
          SizedBox(height: AppSize.s20),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state is AuthLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                label: "Sign Up",
                onPressedAction: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUp(
                      username: usernameController.text,
                      email: emailController.text,
                      age: ageController.text,
                      disabilityType: disabilityTypeController.text,
                      password: passwordController.text,
                    );
                  }
                },
                backgroundColor: ColorManager.mintGreen,
                textColor: ColorManager.black,
              );
            },
          ),
        ],
      ),
    );
  }
}
