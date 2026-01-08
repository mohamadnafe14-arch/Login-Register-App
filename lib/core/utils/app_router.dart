import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/login_view.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/regsiter_view.dart';
import 'package:login_and_register_app/features/splash_feature/presentation/views/splash_view.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
