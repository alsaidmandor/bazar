import 'package:bazaar/Feature/auhtentication/signup/logic/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/utils/SharedPrefKeys.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/authentication_repository.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenticationRepository _authRepository;

  SignupCubit(this._authRepository) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();

  String defaultProfile =
      'https://static.vecteezy.com/system/resources/previews/001/840/612/non_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg';

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _authRepository.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    response.when(success: (signupResponse) async {
      createUserData();
      await saveUserUid(signupResponse.user!.uid);

      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error));
    });
  }

  void emitSubmitPhoneNumber(BuildContext context) {
    try {
      emit(const SignupState.signupSubmitPhoneNumberLoading());
      _authRepository.submitPhoneNumber(phoneController.text, context);
      _authRepository.updateUserPhone(phoneController.text);

      emit(const SignupState.signupSubmitPhoneNumberSuccess());
    } on FirebaseAuthException catch (e) {
      debugPrint('Error linking phone number : ${e.code}');
      emit(SignupState.signupSubmitPhoneNumberError(error: e.code));
    }
  }

  void emitSubmitOtp(
      {required String otpCode, required String verificationId}) {
    try {
      emit(const SignupState.signupSubmitOtpLoading());
      _authRepository.submitOTP(
          otpCode: otpCode, verificationId: verificationId);
      emit(const SignupState.signupSubmitOtpSuccess());
    } on FirebaseAuthException catch (e) {
      debugPrint('Error linking phone number : ${e.code}');
      emit(SignupState.signupSubmitOtpError(error: e.code));
    }
  }

  Future<void> saveUserUid(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userUid, token);
  }

  void createUserData() async {
    try {
      emit(const SignupState.signupSaveDataLoading());
      // Create UserModel instance
      UserModel userModel = UserModel(
        name: nameController.text,
        email: emailController.text,
        phone: '',
        imageUrl: defaultProfile,
        address: 'Cairo', // You can get this from a user input if needed
        id: _authRepository.currentUser!.uid, // Get the user's UID
      );

      debugPrint('User Model: ${userModel.toMap()}'); // Print the user model data
      debugPrint(
          'user Model  : name : ${userModel.name} email : ${userModel.email} phone : ${userModel.phone}');
      // Save userModel data to Firestore
      await _authRepository.saveUserData(userModel);
      emit(const SignupState.signupSaveDataSuccess());
    } catch (error, stacktrace) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      emit(SignupState.signupSaveDataError(error: error.toString()));
    }
  }
}
