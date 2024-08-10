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
      ),
    );
  }
}
