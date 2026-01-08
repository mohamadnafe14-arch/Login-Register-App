import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    required this.onChanged,
    required this.prefixIcon,
    this.isSecure = false,
    this.onTap,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
        hint: Text(hintText, style: TextStyle(color: Colors.grey)),
        prefixIcon: GestureDetector(onTap: onTap, child: Icon(prefixIcon)),
      ),
      obscureText: isSecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!value.contains("@")) {
          return "Please enter a valid email";
        }
        return null;
      },
      onSaved: (value) => onSaved!(value),
      onChanged: (value) => onChanged!(value),
    );
  }
}
