import 'package:bazaar/Feature/auhtentication/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/shared_pref_helper.dart';
import '../../../../../core/utils/SharedPrefKeys.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _repository;

  LoginCubit(this._repository) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _repository.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    response.when(success: (loginResponse) async {
      await saveUserUid(loginResponse.user!.uid ?? '');
      emit( LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.toString() ?? ''));
    });
  }

  Future<void> emitGoogleSignIn(BuildContext context) async {
    emit(const LoginState.googleSignInLoading());
    final response = await _repository.signInWithGoogle(context);
    response.when(success: (googleSignIn) async {
      await saveUserUid(googleSignIn!.uid ?? '');
      emit( const LoginState.googleSignInSuccess());
    }, failure: (error) {
      emit(LoginState.googleSignInError(error: error.toString() ?? ''));
    });
  }

  Future<void> saveUserUid(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userUid, token);
  }
}
