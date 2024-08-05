import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/sign_up_form.dart';
import 'package:bazaar/Feature/auhtentication/signup/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../logic/sign_up_cubit.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.fontHeading24BlackBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.fontBody16BlackRegular.copyWith(color: AppColor.greyScale500),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const AlreadyHaveAccountText(),

                    verticalSpace(30),
                    const TermsAndConditionsText(),

                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    }
  }
}