import 'package:flutter/material.dart';
import '../../../../utils/values_managers.dart';
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.contentPadding =
    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.borderRadius = AppSize.s10,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isPasswordHidden : false,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.textColor),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: widget.textColor)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.borderColor, width: 1.5),
        ),
        contentPadding: widget.contentPadding,
        // يتم عرض الـ suffixIcon المُمرر إذا كان موجوداً،
        // أما إذا لم يكن موجوداً وكان الحقل لكلمة مرور فيتم عرض زر الإخفاء/الإظهار.
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
              icon: Icon(
                _isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: widget.textColor,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordHidden = !_isPasswordHidden;
                });
              },
            )
                : null),
      ),
      validator: widget.validator,
    );
  }
}
