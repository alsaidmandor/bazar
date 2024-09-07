import 'dart:io';

import 'package:bazaar/Feature/auhtentication/signup/ui/otp_screen.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/networking/firebase_result.dart';
import '../../../../core/routing/routes.dart';
import '../model/user_model.dart';

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
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return FirebaseResult.failure(error.toString());
    }
  }

  // Create Sign up if you have account
  Future<FirebaseResult<UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return FirebaseResult.success(response);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return FirebaseResult.failure(error.toString());
    }
  }

  Future<FirebaseResult<User?>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return FirebaseResult.success(currentUser);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return FirebaseResult.failure(error.toString());
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user_images/$fileName');
    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.whenComplete(() => null);
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).set(user.toMap());
    } catch(error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }
  }

  Future<void> updateUserPhone(String phone) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({'phone': phone});
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }
  }


  // Google Sign-In
  Future<FirebaseResult<User?>> signInWithGoogle( context) async {
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
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return FirebaseResult.failure(error.toString());
    }
  }

  Future<UserCredential> signInWithCredential(
      PhoneAuthCredential credential) async {
    try {
      return await _auth.signInWithCredential(credential);
    } catch (error,stacktrace ) {
        FirebaseCrashlytics.instance.recordError(error, stacktrace);
        rethrow;
    }
  }

  // Phone Authentication

  Future<void> submitPhoneNumber(
      String phoneNumber, BuildContext context,) async {
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
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      debugPrint('error when sign in phone number: $error');
    }
  }

  // Link Accounts
  Future<void> linkWithCredential(User user, AuthCredential credential) async {
    try {
      await user.linkWithCredential(credential);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      debugPrint('linkWithCredential error : $error');

      // rethrow; // Rethrow to handle errors in the calling code
    }
  }

  // Unlink Accounts
  Future<void> unlinkFromCredential(User user, String providerId) async {
    try {
      await user.unlink(providerId);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      rethrow;
    }
  }

/*
  Future<void> checkPhoneAndGoogleLinked(String email) async {
    try {
      final auth = FirebaseAuth.instance;

      // Fetch the sign-in methods for the email
      List<String> signInMethods = await auth.fetchSignInMethodsForEmail(email);

      // Check if phone authentication is one of the sign-in methods
      bool isPhoneLinked =
          signInMethods.contains(PhoneAuthProvider.PHONE_SIGN_IN_METHOD);

      // Check if Google authentication is one of the sign-in methods
      bool isGoogleLinked =
          signInMethods.contains(GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD);

      if (isPhoneLinked) {
        print("Phone number is linked with this email.");
      } else {
        print("Phone number is not linked with this email.");
      }

      if (isGoogleLinked) {
        print("Google account is linked with this email.");
      } else {
        print("Google account is not linked with this email.");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
*/

  // Get Current User
  User? get currentUser => _auth.currentUser;
}
