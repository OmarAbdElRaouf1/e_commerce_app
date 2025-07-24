import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart' show UserEntity;
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart' show AuthRepo;

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninCubitInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }
}
