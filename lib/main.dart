import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_and_register_app/core/utils/service_locator.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/manager/cubits/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBV-Mf-0WeD5lR1PMDG4hfqHZt15LwKmFw",
        appId: "1:152777030874:android:73c40901bb4081f562b9e3",
        messagingSenderId: "152777030874",
        projectId: "login-9a6ed",
      ),
    );
  }
  setupServiceLocator();
  runApp(const LoginAndRegisterApp());
}

class LoginAndRegisterApp extends StatelessWidget {
  const LoginAndRegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepo>()),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => child!,
        splitScreenMode: true,
        minTextAdapt: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
