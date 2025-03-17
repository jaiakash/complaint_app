import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        _handleAuthException(FirebaseAuthException(
          code: 'sign-in-aborted',
          message: 'Google sign in aborted',
        ));
        return null; // Return null if the user cancels sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential and return the result
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null; // Return null in case of an error
    } catch (e) {
      _handleAuthException(FirebaseAuthException(
        code: 'unknown-error',
        message: 'Failed to sign in with Google: ${e.toString()}',
      ));
      return null; // Return null in case of an unknown error
    }
  }

  // SEND OTP FOR PHONE AUTHENTICATION
  Future<void> sendOTP(
      String phoneNumber, void Function(String, int?) codeSent) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          _handleAuthException(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId, resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    }
  }

  // VERIFY OTP
  Future<UserCredential?> verifyOTP(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      _handleAuthException(FirebaseAuthException(
        code: 'sign-out-error',
        message: 'Failed to sign out: ${e.toString()}',
      ));
    }
  }

  // Password reset
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    }
  }

  // Handle Firebase auth exceptions
  void _handleAuthException(FirebaseAuthException e) {
    print('Firebase Auth Error: ${e.code} - ${e.message}');

    String message;
    switch (e.code) {
      case 'user-not-found':
        message = 'No user found with this email.';
        break;
      case 'wrong-password':
        message = 'Incorrect password.';
        break;
      case 'email-already-in-use':
        message = 'This email is already registered.';
        break;
      case 'weak-password':
        message = 'Password is too weak.';
        break;
      case 'invalid-email':
        message = 'Invalid email format.';
        break;
      case 'operation-not-allowed':
        message = 'This sign-in method is not enabled.';
        break;
      case 'account-exists-with-different-credential':
        message = 'An account already exists with the same email address but different sign-in credentials.';
        break;
      case 'sign-in-aborted':
        message = 'Google sign in aborted.';
        break;
      case 'sign-out-error':
        message = 'Failed to sign out.';
        break;
      case 'unknown-error':
        message = e.message ?? 'An unknown error occurred.';
        break;
      default:
        message = 'An error occurred. Please try again.';
    }

    // Show toast message
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
