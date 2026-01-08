import 'package:flutter/material.dart';
import 'package:login_and_register_app/features/splash_feature/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: SplashViewBody(),
    ));
  }
}