import 'package:bazaar/Feature/auhtentication/login/ui/widgets/email_reset_pass_form.dart';
import 'package:bazaar/Feature/auhtentication/login/ui/widgets/reset_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyles.fontHeading24BlackBold,
              ),
              verticalSpace(8),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Please enter your email, we will send verification code to your email.',
                  style: TextStyles.fontBody16BlackRegular
                      .copyWith(color: AppColor.greyScale500),
                ),
              ),
              verticalSpace(36),
              const EmailResetPassForm(),
              verticalSpace(80),
              AppTextButton(
                buttonText: "Send",
                textStyle: TextStyles.fontHeading16BlackBold
                    .copyWith(color: AppColor.white),
                onPressed: () {
                  context.read<LoginCubit>().emitResetPasswordEmail();
                },
              ),
              const ResetPasswordBlocListener()
            ],
          ),
        ),
      )),
    );
  }
}
