import 'package:bazaar/Feature/auhtentication/login/ui/widgets/dont_have_account_text.dart';
import 'package:bazaar/Feature/auhtentication/login/ui/widgets/email_and_password.dart';
import 'package:bazaar/Feature/auhtentication/login/ui/widgets/login_bloc_listener.dart';
import 'package:bazaar/Feature/auhtentication/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/svg_image.dart';
import '../logic/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  'Welcome Back',
                  style: TextStyles.fontHeading24BlackBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.fontBody14BlackSemiBold
                            .copyWith(color: AppColor.primary500),
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const DontHaveAccountText(),
                    verticalSpace(60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Expanded(
                          child: Container(
                            height: 1.0.h,
                            color: AppColor.greyScale500,
                          ),
                        ),
                        verticalSpace(32),
                        Text(
                          ' Or with ',
                          style: TextStyles.fontBody14BlackSemiBold.copyWith(color: AppColor.greyScale500),
                        ),
                        verticalSpace(32),
                        Expanded(
                          child: Container(
                            height: 1.0.h,
                            color: AppColor.greyScale500,),
                        )
                      ],
                    ),
                    verticalSpace(20.h),
                    AppTextButton(
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {
                      },
                      borderRadius: 20,
                      isBorderSide: true,
                      buttonText: '',

                      colorBorderSide: AppColor.primary500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgImage(assetPath: 'assets/icons/google.svg',),
                          horizontalSpace(5),
                          const Text('Login with Google'),
                        ],
                      ),
                    ),
                    verticalSpace(20.h),
                    AppTextButton(
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {},
                      borderRadius: 20,
                      buttonText: '',
                      isBorderSide: true,
                      colorBorderSide: AppColor.primary500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgImage(assetPath: 'assets/icons/apple.svg',),
                          horizontalSpace(5),
                          const Text('Login with Apple'),
                        ],
                      ),
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      // context.read<LoginCubit>().emitLoginStates();
    }
  }
}
