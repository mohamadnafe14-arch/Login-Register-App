import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/manager/cubits/auth_cubit/auth_cubit_cubit.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/custom_app_bar.dart';
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
  bool isLoading = false;
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
              CustomAppBar(title: "Login"),
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
              BlocListener<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  if (state is AuthCubitLoading) {
                    setState(() => isLoading = true);
                  } else if (state is AuthCubitSuccess) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have successfully logged in"),
                      ),
                    );
                  }else if (state is AuthCubitError) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: CustomButton(
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
                  loading: isLoading,
                ),
              ),
              SizedBox(height: 20.h),
              Footer(
                firstText: "No account?",
                secondeText: "Register",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.registerRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
