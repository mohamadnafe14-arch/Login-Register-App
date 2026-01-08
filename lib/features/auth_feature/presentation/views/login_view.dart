import 'package:flutter/material.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Login'), centerTitle: true),
        body: LoginViewBody(),
      ),
    );
  }
}
