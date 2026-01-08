import 'package:go_router/go_router.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/login_view.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/views/regsiter_view.dart';
import 'package:login_and_register_app/features/splash_feature/presentation/views/splash_view.dart';

class AppRouter {
  static final String initialRoute = '/';
  static final String loginRoute = '/login';
  static final String registerRoute = '/register';
 static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
