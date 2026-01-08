import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_and_register_app/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
   Firebase.initializeApp();
  runApp(const LoginAndRegisterApp());
}

class LoginAndRegisterApp extends StatelessWidget {
  const LoginAndRegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
