import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/sign_up_phone_form.dart';
import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/sign_up_submit_phone_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../logic/sign_up_cubit.dart';

class SignUpPhoneScreen extends StatelessWidget {
  const SignUpPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Phone Number',
                style: TextStyles.fontHeading24BlackBold,
              ),
              verticalSpace(8),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Please enter your phone number, so we can more easily deliver your orders.',
                  style: TextStyles.fontBody16BlackRegular
                      .copyWith(color: AppColor.greyScale500),
                ),
              ),
              verticalSpace(36),
              const SignupPhoneForm(),
              verticalSpace(80),
              AppTextButton(
                buttonText: "Continue",
                textStyle: TextStyles.fontHeading16BlackBold
                    .copyWith(color: AppColor.white),
                onPressed: () {
                  validateThenDoSignup(context);
                },
              ),
              const SignupSubmitPhoneBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKeyPhone.currentState!.validate()) {
      context.read<SignupCubit>().formKeyPhone.currentState!.save();
      context.read<SignupCubit>().emitSubmitPhoneNumber(context);
    }
  }
}
