import 'package:flutter/material.dart';

import '../../../../utils/values_managers.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressedAction;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressedAction,
    required this.backgroundColor,
    required this.textColor,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(
          padding ??
              EdgeInsets.symmetric(
                vertical: AppSize.s16,
                horizontal: AppSize.s32,
              ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(width ?? double.infinity, height ?? AppSize.s50),
        ),
      ),
      onPressed: onPressedAction,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? AppSize.s18,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
