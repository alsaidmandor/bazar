import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13BlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font13BlueRegular,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
        ],
      ),
    );
  }
}
