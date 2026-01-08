import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:login_and_register_app/core/utils/app_styles.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
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
  final TextEditingController passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
              Row(children: [Text('Email', style: AppStyles.headerStyle)]),
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
              Row(children: [Text('Name', style: AppStyles.headerStyle)]),
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
              Row(children: [Text('Password', style: AppStyles.headerStyle)]),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'password must be at least 6 characters';
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
                  Text('confirm password', style: AppStyles.headerStyle),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: "confirm your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (value != passwordController.text) {
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
              BlocListener<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  if (state is AuthCubitLoading) {
                    setState(() => isLoading = true);
                  } else if (state is AuthCubitSuccess) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Register successfully")),
                    );
                  } else if (state is AuthCubitError) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).register(email: email!, password: password!);
                    }
                  },
                  text: "Register",
                  loading: isLoading,
                ),
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
