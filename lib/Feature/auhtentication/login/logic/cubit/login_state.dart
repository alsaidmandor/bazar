import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
//   state google signIn
  const factory LoginState.googleSignInLoading() = GoogleSignInLoading;
  const factory LoginState.googleSignInSuccess() = GoogleSignInSuccess;
  const factory LoginState.googleSignInError({required String error}) =
      GoogleSignInError;
}
