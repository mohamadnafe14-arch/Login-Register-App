import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_and_register_app/core/errors/failuer.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({required super.firebaseAuth});

  @override
  Future<Either<Failuer, User>> login(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, User>> register(String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
