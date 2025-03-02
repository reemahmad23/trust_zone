import 'package:flutter/material.dart';
import '../../../../utils/color_managers.dart';
import '../../../../utils/values_managers.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ✅ **دالة التحقق من البريد الإلكتروني**
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Padding(
        padding: EdgeInsets.only(top: AppSize.s100, left: AppSize.s20, right: AppSize.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Your Password?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),
              ),
              SizedBox(height: AppSize.s20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      labelText: "Enter Your Email",
                      validator: validateEmail,
                    ),
                    SizedBox(height: AppSize.s20),
                    CustomButton(
                      label: "Submit",
                      onPressedAction: () {
                        if (formKey.currentState!.validate()) {
                          // **تنفيذ عملية استعادة كلمة المرور**
                          // يمكنك إضافة أي منطق هنا مثل إرسال بريد إلكتروني لاستعادة كلمة المرور
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password reset link sent to your email")),
                          );
                        }
                      },
                      backgroundColor: ColorManager.mintGreen,
                      textColor: ColorManager.black,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
