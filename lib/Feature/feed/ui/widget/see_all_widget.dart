import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class SeeAllWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const SeeAllWidget({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.fontHeading20BlackBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onPress,
          child: Text(
            'See All',
            style: TextStyles.fontBody14BlackBold
                .copyWith(color: AppColor.primary500),
          ),
        ),
      ],
    );
  }
}
