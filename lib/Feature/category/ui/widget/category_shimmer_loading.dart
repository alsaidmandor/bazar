import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 160.h,
          width: 158.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: AppColor.white,
                child: Container(
                  width: 158.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
              verticalSpace(8),
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: Container(
                  height: 14.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.greyScale100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              verticalSpace(2),
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: Container(
                  height: 14.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.greyScale100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}