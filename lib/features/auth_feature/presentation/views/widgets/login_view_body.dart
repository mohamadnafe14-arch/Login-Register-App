import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_text_form_field.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/footer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late GlobalKey<FormState> formKey;
  String? email, password;
  bool isSecure = true;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(
                "Login and register app",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.h),
              Divider(thickness: 1, color: Colors.grey.shade300),
              SizedBox(height: 20.h),
              Text(
                "start",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                isSecure: isSecure,
                onTap: () => setState(() => isSecure = !isSecure),
              ),
              SizedBox(height: 20.h),
              Row(
                children: const [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                onSaved: (value) => password = value,
                onChanged: (value) => password = value,
                prefixIcon: Icons.lock,
                isSecure: isSecure,
                onTap: () => setState(() => isSecure = !isSecure),
              ),
              SizedBox(height: 50.h),
              CustomButton(
                text: "Login",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have successfully logged in"),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
              Footer(firstText: "No account?", secondeText: "Register", onPressed:(){})             
            ],
          ),
        ),
      ),
    );
  }
}
