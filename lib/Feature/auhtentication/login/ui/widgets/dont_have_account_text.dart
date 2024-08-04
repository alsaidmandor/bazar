import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.fontBody16BlackMedium.copyWith(color: AppColor.greyScale500),
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.fontBody16BlackMedium.copyWith(color: AppColor.primary500),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // context.pushReplacementNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}