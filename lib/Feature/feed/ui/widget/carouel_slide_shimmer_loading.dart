import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';

class CarouelSlideShimmerLoading extends StatelessWidget {
  const CarouelSlideShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 240.h,
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: AppColor.greyScale100,
              highlightColor: AppColor.white,
              child: Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  ),
                ),
                horizontalSpace(5.w),
                Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  ),
                ),
                horizontalSpace(5.w),
                Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
