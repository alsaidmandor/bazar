import 'package:bazaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/styles.dart';


class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By clicking Register, you agree to our\n',
            style: TextStyles.fontBody14BlackMedium.copyWith(color: AppColor.greyScale500),
          ),
          TextSpan(
            text: 'Terms and Data Policy.',
            style: TextStyles.fontBody14BlackMedium.copyWith(color: AppColor.primary500),
          ),

        ],
      ),
    );
  }
}
