import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/auth/data/models/signup_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthDataSource {
  Future<bool> loginWithEmailAndPassword({required AuthRequestBody request});
  //  Future<UserModel> loginWithGoogle({
  //    required String email,
  //    required String password,
  //  });
  Future<bool> signUpWithEmailAndPassword({required AuthRequestBody request});
  Future<bool> isUserSignedIn();
  Future<bool> signinWithGoogle();
  void logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Future<bool> loginWithEmailAndPassword({
    required AuthRequestBody request,
  }) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      // Assuming you want to return some user data after successful login
      User? user = userCredential.user;

      // Check if the user is null
      if (user != null) {
        // Assuming SignupResponseBody has fields like userId and email
        // return SignupResponseBody(
        //   userId: user.uid,
        //   email: user.email ?? '',  // In case email is null
        //   message: 'Login successful',
        // );
        return true;
      } else {
        throw Exception('Login failed. User is null.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      throw Exception('FirebaseAuthException: ${e.message}');
    } catch (e) {
      // General error handling
      throw Exception('An unknown error occurred: $e');
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassword({
    required AuthRequestBody request,
  }) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      // Assuming you want to return some user data after successful login
      User? user = userCredential.user;

      // Check if the user is null
      if (user != null) {
        // Assuming SignupResponseBody has fields like userId and email
        // return SignupResponseBody(
        //   userId: user.uid,
        //   email: user.email ?? '',  // In case email is null
        //   message: 'Login successful',
        // );
        return true;
      } else {
        throw Exception('signUp failed. User is null.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      throw Exception('FirebaseAuthException: ${e.message}');
    } catch (e) {
      // General error handling
      throw Exception('An unknown error occurred: $e');
    }
  }

  @override
  Future<bool> isUserSignedIn() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        return true;
      } else {
        logger.d('Google sign-in failed');
      }
    } catch (e) {
      logger.d('Google sign-in error: $e');
    }
    return false;
  }

  @override
  Future<bool> signinWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        logger.d('Signed in with Google: ${user.displayName}');
        return true;
      } else {
        logger.d('Google sign-in failed');
      }
    } catch (e) {
      logger.d('Google sign-in error: $e');
    }
    return false;
  }

  @override
  void logout() {
    _firebaseAuth.signOut();
  }
}
