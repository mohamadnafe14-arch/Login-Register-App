import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_register_app/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login and register app",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20.h),
        Divider(thickness: 1, color: Colors.grey.shade300),
        SizedBox(height: 20.h),
        Text("start", style: AppStyles.headerStyle),
      ],
    );
  }
}
