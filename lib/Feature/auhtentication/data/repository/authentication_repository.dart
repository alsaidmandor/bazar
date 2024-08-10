import 'package:bazaar/Feature/auhtentication/signup/ui/otp_screen.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/networking/firebase_result.dart';
import '../../../../core/routing/routes.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late String verificationId;

  // Email/Password Authentication
  Future<FirebaseResult<UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return FirebaseResult.success(response);
    } catch (e) {
      return FirebaseResult.failure(e.toString());
    }
  }

  // Create Sign up if you have account
  Future<FirebaseResult<UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return FirebaseResult.success(response);
    } catch (e) {
      return FirebaseResult.failure(e.toString());
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Google Sign-In
  Future<FirebaseResult<User?>> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (currentUser != null) {
        linkWithCredential(currentUser!, credential);
      } else {
        await _auth.signInWithCredential(credential);

        // NavigateInterface.navigateToPage();
        context.pushNamed(
          Routes.signUpPhoneScreen,
        );
      }
      return FirebaseResult.success(currentUser);
    } catch (e) {
      return FirebaseResult.failure(e.toString());
    }
  }

  Future<UserCredential> signInWithCredential(
      PhoneAuthCredential credential) async {
    try {
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  // Phone Authentication

  Future<void> submitPhoneNumber(
      String phoneNumber, BuildContext context) async {
    try {
      if (currentUser != null) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+2$phoneNumber',
          timeout: const Duration(seconds: 14),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: (verificationId, forceResendingToken) {
            debugPrint('Send code : $verificationId + $forceResendingToken');

            this.verificationId = verificationId;
            // NavigateInterface.navigateToPage();
            context.pushNamed(
              Routes.otpScreen,
              arguments: OtpScreen(
                  phoneNumber: phoneNumber, verificationId: verificationId),
            );
          },
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        );
      } else {
        debugPrint('User is not signed in.');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('Error linking phone number : ${e.code}');
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    debugPrint('verificationCompleted ');
    linkWithCredential(currentUser!, credential);

    // await signInPhone(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    debugPrint('verificationFailed : $error');
  }

/*
  void codeSent(String verificationId, int? resendToken) {
    debugPrint('Send code : $verificationId + $resendToken');

    this.verificationId = verificationId;
    // NavigateInterface.navigateToPage();
  }
*/

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
    debugPrint('codeAutoRetrievalTimeout : $verificationId');
  }

  Future<void> submitOTP(
      {required String otpCode, required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    linkWithCredential(currentUser!, credential);

    // await signInPhone(credential);
  }

  Future<void> signInPhone(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('success when sign in phone number');
    } catch (error) {
      debugPrint('error when sign in phone number: $error');
    }
  }

  // Link Accounts
  Future<void> linkWithCredential(User user, AuthCredential credential) async {
    try {
      await user.linkWithCredential(credential);
    } catch (e) {
      debugPrint('linkWithCredential error : $e');

      // rethrow; // Rethrow to handle errors in the calling code
    }
  }

  // Unlink Accounts
  Future<void> unlinkFromCredential(User user, String providerId) async {
    try {
      await user.unlink(providerId);
    } catch (e) {
      rethrow;
    }
  }

  // Get Current User
  User? get currentUser => _auth.currentUser;
}
