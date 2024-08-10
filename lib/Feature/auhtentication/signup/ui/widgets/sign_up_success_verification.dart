import 'package:bazaar/core/helper/spacing.dart';
import 'package:bazaar/core/theme/styles.dart';
import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/widgets/svg_image.dart';
import '../../../../../generated/assets.dart';

class SignUpSuccessVerification extends StatelessWidget {
  const SignUpSuccessVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgImage(
              assetPath: Assets.iconsCongrat,
            ),
            Text(
              'Congratulation!',
              textAlign: TextAlign.center,
              style: TextStyles.fontHeading24BlackBold,
            ),
            verticalSpace(10),
            Text(
              'your account is complete, please enjoy the best menu from us.',
              textAlign: TextAlign.center,
              style: TextStyles.fontBody16BlackRegular,
            ),
            verticalSpace(25),
            AppTextButton(
              buttonText: 'Get Started',
              textStyle: TextStyles.fontHeading16BlackBold
                  .copyWith(color: AppColor.white),
              onPressed: () {
                // context.pushReplacementNamed(Routes)
              },
            )
          ],
        ),
      )),
    );
  }
}
