import 'dart:developer';

import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User> signInWithEmailAndPassword({required String email, required String password}) async {
    // Implementation for signing in a user with email and password using Firebase
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.code} - ${e.message},and code = ${e.code}');
      if (e.code == 'wrong-password' || e.code == 'user-not-found' || e.code == 'invalid-credential') {
        throw CustomException('البريد الالكتروني او الباسورد غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('لا يوجد اتصال بالانترنت.');
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

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }
}
