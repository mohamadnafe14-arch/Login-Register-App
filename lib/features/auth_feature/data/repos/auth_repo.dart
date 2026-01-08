import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_and_register_app/core/errors/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failuer, User>> login(String email, String password);
  Future<Either<Failuer, User>> register(String email, String password);
}
