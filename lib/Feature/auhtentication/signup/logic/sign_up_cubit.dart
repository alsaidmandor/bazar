import 'package:bazaar/Feature/auhtentication/signup/logic/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/utils/SharedPrefKeys.dart';
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

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _authRepository.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    response.when(success: (signupResponse) async {
      await saveUserUid(signupResponse.user!.uid ?? '');
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error ?? ''));
    });
  }

  void emitSubmitPhoneNumber(BuildContext context) {
    try {
      emit(const SignupState.signupSubmitPhoneNumberLoading());
      _authRepository.submitPhoneNumber(phoneController.text, context);
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
}
