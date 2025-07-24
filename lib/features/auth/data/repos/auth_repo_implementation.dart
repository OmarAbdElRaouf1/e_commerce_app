import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';

import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';

import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Error in createUserWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Error in signInWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('يرجى المحاولة مرة أخرى لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Error in signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure('يرجى المحاولة مرة أخرى لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Error in signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure('يرجى المحاولة مرة أخرى لاحقاً'));
    }
  }
}
