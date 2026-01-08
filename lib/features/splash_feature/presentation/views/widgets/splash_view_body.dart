import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:login_and_register_app/features/splash_feature/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initAnimation();
    goToLogin();
    super.initState();
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void goToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.login, size: 100),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}
