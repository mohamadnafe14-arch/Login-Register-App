import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_text_form_field.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/footer.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late GlobalKey<FormState> formKey;
  String? email, name, password, confirmPassword;
  bool isSecure = true, isConfirmSecure = true, isLoading = false;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomAppBar(title: "Register"),
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "Enter your email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains("@")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                onSaved: (value) => email = value,
                onChanged: (value) => email = value,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "Enter your name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => name = value,
                onChanged: (value) => name = value,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => password = value,
                onChanged: (value) => password = value,
                prefixIcon: Icons.lock,
                isSecure: isSecure,
                onTap: () => setState(() => isSecure = !isSecure),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'confirm password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "confirm your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (value != password) {
                    return 'password not match';
                  }
                  return null;
                },
                onSaved: (value) => confirmPassword = value,
                onChanged: (value) => confirmPassword = value,
                prefixIcon: Icons.lock,
                isSecure: isConfirmSecure,
                onTap: () => setState(() => isConfirmSecure = !isConfirmSecure),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Register successfully")),
                    );
                  }
                },
                text: "Register",
                loading: isLoading,
              ),
              Footer(
                firstText: "Already have an account",
                secondeText: "Login",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.loginRoute);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
