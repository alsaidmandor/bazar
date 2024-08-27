import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.imagesBook3), // verticalSpace(20),

    );
  }
}
