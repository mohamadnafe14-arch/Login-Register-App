import 'package:bloc/bloc.dart';
import 'package:login_and_register_app/features/auth_feature/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit(this.authRepo) : super(AuthCubitInitial());
  final AuthRepo authRepo;
  void login() async {
    emit(AuthCubitLoading());
    final result = await authRepo.login("email", "password");
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (user) => emit(AuthCubitSuccess()),
    );
  }
  void register() async {
    emit(AuthCubitLoading());
    final result = await authRepo.register("email", "password");
    result.fold(
      (failuer) => emit(AuthCubitError(failuer.message)),
      (user) => emit(AuthCubitSuccess()),
    );
  }
}
