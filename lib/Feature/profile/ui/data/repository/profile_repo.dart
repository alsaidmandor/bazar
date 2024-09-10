
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/networking/firebase_result.dart';
import '../../../../auhtentication/data/model/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  User? get currentUser => _auth.currentUser;

  Future<FirebaseResult<UserModel>> getUserData() async {
    try {
      final snapshot = await _firestore.collection('users').doc(
          currentUser!.uid).get();
      var response = UserModel.fromMap(snapshot.data()!);
      debugPrint('Address repo ${response.address}');
      return FirebaseResult.success(response);
    } catch (error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return FirebaseResult.failure(error.toString());
    }
  }


  Future<void> updateProfile(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } on FirebaseException catch (error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }
  }


  Future<String> uploadImage(File imageFile) async {
    try {
      final ref = _storage.ref().child('user_images/${DateTime
          .now()
          .millisecondsSinceEpoch}');
      final task = await ref.putFile(imageFile);
      final url = await task.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return error.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (error,stacktrace ) {
       FirebaseCrashlytics.instance.recordError(error, stacktrace);
    }
  }

}