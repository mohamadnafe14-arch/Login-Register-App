import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.deepPurple,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
