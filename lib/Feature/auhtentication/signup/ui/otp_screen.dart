import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/sign_up_submit_otp_bloc_listener.dart';
import 'package:bazaar/core/helper/spacing.dart';
import 'package:bazaar/core/theme/styles.dart';
import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/colors.dart';
import '../logic/sign_up_cubit.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final phoneNumber;
  final verificationId;

  OtpScreen(
      {super.key, required this.phoneNumber, required this.verificationId});

  late String otpCode;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Verification Phone',
          style: TextStyles.fontHeading24BlackBold,
        ),
        verticalSpace(16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Please enter the code we just sent to phone number ',
              style: TextStyles.fontBody16BlackRegular
                  .copyWith(color: AppColor.greyScale500),
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumber',
                  style: const TextStyle(color: AppColor.greyScale900),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: AppColor.greyScale900,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: AppColor.primary500,
        inactiveColor: AppColor.greyScale50,
        inactiveFillColor: AppColor.greyScale50,
        activeFillColor: AppColor.greyScale50,
        selectedColor: AppColor.primary500,
        selectedFillColor: AppColor.greyScale50,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }

  void _login(BuildContext context) {
    // BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

  // Widget _buildVrifyButton(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         showProgressIndicator(context);
  //
  //         _login(context);
  //       },
  //       child: Text(
  //         'Verify',
  //         style: TextStyle(color: Colors.white, fontSize: 16),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: Size(110, 50),
  //         primary: Colors.black,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(6),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildPhoneVerificationBloc() {
  //   return BlocListener<PhoneAuthCubit, PhoneAuthState>(
  //     listenWhen: (previous, current) {
  //       return previous != current;
  //     },
  //     listener: (context, state) {
  //       if (state is Loading) {
  //         showProgressIndicator(context);
  //       }
  //
  //       if (state is PhoneOTPVerified) {
  //         Navigator.pop(context);
  //         Navigator.of(context).pushReplacementNamed(mapScreen);
  //       }
  //
  //       if (state is ErrorOccurred) {
  //         //Navigator.pop(context);
  //         String errorMsg = (state).errorMsg;
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(errorMsg),
  //             backgroundColor: Colors.black,
  //             duration: Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIntroTexts(),
                verticalSpace(88),
                _buildPinCodeFields(context),
                verticalSpace(60),
                AppTextButton(
                  buttonText: "Continue",
                  textStyle: TextStyles.fontHeading16BlackBold
                      .copyWith(color: AppColor.white),
                  onPressed: () {
                    context.read<SignupCubit>().emitSubmitOtp(
                        verificationId: verificationId, otpCode: otpCode);
                  },
                ),
                const SignupSubmitOtpBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
