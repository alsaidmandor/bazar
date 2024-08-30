import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/icon_broken.dart';

class CategoryEmpty extends StatelessWidget {
  const CategoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:Icon(IconBroken.Category,color: AppColor.greyScale500,size: 50,),
    );
  }
}
