import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';
// flutter pub run build_runner watch --delete-conflicting-outputs

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
  const factory SignupState.signupError({required String error}) = SignupError;
//   submit phone number
  const factory SignupState.signupSubmitPhoneNumberLoading() =
      SignupSubmitPhoneNumberLoading;
  const factory SignupState.signupSubmitPhoneNumberSuccess() =
      SignupSubmitPhoneNumberSuccess;
  const factory SignupState.signupSubmitPhoneNumberError(
      {required String error}) = SignupSubmitPhoneNumberError;
//   submit Otp
  const factory SignupState.signupSubmitOtpLoading() = SignupSubmitOtpLoading;
  const factory SignupState.signupSubmitOtpSuccess() = SignupSubmitOtpSuccess;
  const factory SignupState.signupSubmitOtpError({required String error}) =
      SignupSubmitOtpError;
}
