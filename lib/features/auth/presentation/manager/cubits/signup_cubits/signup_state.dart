import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  SignupSuccess(this.user);
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure(this.message);
}
