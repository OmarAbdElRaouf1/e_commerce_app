import 'dart:developer';

import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    // Implementation for creating a user with email and password using Firebase
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.code} - ${e.message},and code = ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException('الباسورد ضعيف جدا.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('لا يوجد اتصال بالانترنت.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الالكتروني مستخدم من قبل.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('هذا البريد الالكتروني غير صالح.');
      } else {
        throw CustomException("حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.");
      }
    } catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException("حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.");
    }
  }
}
