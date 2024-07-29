import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  // Dependencies
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Getters
  User? get currentUser => _firebaseAuth.currentUser;
  FirebaseAuth get instance => _firebaseAuth;

  // Methods

  //* sign up with email and password
  Future<Either<AuthSuccess, AuthFail>> createUserUsingEmailAndPassword(
      {password, email}) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Left(AuthSuccess(result.user!.uid, 'User Created successfully'));
    } on FirebaseAuthException catch (e) {
      return Right(AuthFail(await handleSignUpError(e)));
    }
  }

  //* Change Password
  Future<void> changePassword({required String newPassword}) async {
    await _firebaseAuth.currentUser!.updatePassword(newPassword);
  }

  //* Rest Forgotten Password
  Future<void> resetForgottenPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //* Sign in with email and password

  Future<Either<AuthSuccess, AuthFail>> signInWithEmailAndPassword(
      {password, email}) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Left(AuthSuccess(result.user!.uid, 'User logged in successfully'));
    } on FirebaseAuthException catch (e) {
      return Right(AuthFail(handleLoginError(e)));
    }
  }

  //* SignOut (doesn't typically cause errord)
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //* Reset Password
  Future<Either<ResetPasswordSuccess, ResetPasswordFailure>> resetPassword(
      {email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Left(
          ResetPasswordSuccess('Reset password email sent successfully'));
    } catch (e) {
      return Right(ResetPasswordFailure(handleResetPasswordError(e)));
    }
  }

  //* Send Confirmation Mail
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser!.sendEmailVerification();
  }

  //* Delete User
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }

  //? Addtional Functions

  handleResetPasswordError(e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address format.';

      case 'user-not-found':
        return 'No user found with this email.';

      default:
        return 'Error: ${e.message}';
    }
  }

  handleLoginError(e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address format.';

      case 'user-disabled':
        return 'User has been disabled.';

      case 'user-not-found':
        return 'User not found.';

      case 'wrong-password':
        return 'Incorrect password.';

      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';

      case 'operation-not-allowed':
        return 'Email/password sign-in is not enabled.';

      default:
        return 'An Error Happend While logging. Please Check your internet connection.';
    }
  }

  handleSignUpError(e) async {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';

      case 'invalid-email':
        return 'Invalid email address format.';

      case 'operation-not-allowed':
        return 'Email/password sign-in is not enabled.';

      case 'weak-password':
        return 'The password is too weak.';

      default:
        return 'Error: ${e.message}';
    }
  }
}

// Auth States
class AuthSuccess {
  final String token;
  final String message;

  AuthSuccess(this.token, this.message);
}

class AuthFail {
  final String message;
  AuthFail(this.message);
}

// Reset Password States

class ResetPasswordSuccess {
  final String message;

  ResetPasswordSuccess(this.message);
}

class ResetPasswordFailure {
  final String message;

  ResetPasswordFailure(this.message);
}
