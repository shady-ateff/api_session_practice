import 'package:api_session_practice/shared/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.obscureText, 
    required this.textInputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      strutStyle: const StrutStyle(
        forceStrutHeight: true,
        height: 1.5,
        fontStyle: FontStyle.normal,
      ),
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
