import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';

import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';

import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final DatabaseService databaseService;
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) async {
    User? user;
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, id: user.uid, email: email);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteuser(user);
      log('Error in createUserWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  Future<void> deleteuser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getData(userId: user.uid);
      return Right(userEntity);
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.isUserExist(path: BackendEndpoints.isUserExist, docId: user.uid);
      if (isUserExist) {
        await getData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteuser(user);
      log('Error in signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure('يرجى المحاولة مرة أخرى لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      addUserData(user: userEntity);
      return Right(userEntity);
    } catch (e) {
      await deleteuser(user);
      log('Error in signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure('يرجى المحاولة مرة أخرى لاحقاً'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.add(path: BackendEndpoints.addUserData, data: user.toMap(), docId: user.id);
  }

  @override
  Future<UserEntity> getData({required String userId}) async {
    var data = await databaseService.getData(path: BackendEndpoints.getUserData, docId: userId);
    return UserModel.fromJson(data);
  }
}
