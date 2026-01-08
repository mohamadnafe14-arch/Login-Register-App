import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo_impl.dart';

final getIt=GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuth: getIt()));
}