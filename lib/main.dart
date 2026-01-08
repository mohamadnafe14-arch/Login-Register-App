import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_and_register_app/core/utils/service_locator.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo.dart';
import 'package:login_and_register_app/features/auth_feature/presentation/manager/cubits/auth_cubit/auth_cubit_cubit.dart';

void main() {
  Firebase.initializeApp();
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
