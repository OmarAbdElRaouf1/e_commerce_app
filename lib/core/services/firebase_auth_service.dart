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
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else {
        throw CustomException(" The email address is not valid.");
      }
    } catch (e) {
      throw CustomException("An error occurred , please try again later.");
    }
  }
}
