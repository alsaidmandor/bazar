import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/colors.dart';

class SeeAllShimmerLoading extends StatelessWidget {
  const SeeAllShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.greyScale100,
          highlightColor: AppColor.white,
          child: Container(
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              color: AppColor.white,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColor.greyScale100,
          highlightColor: AppColor.white,
          child: Container(
            width: 70.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
