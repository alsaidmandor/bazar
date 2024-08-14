import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';

class AuthorShimmerLoading extends StatelessWidget {
  const AuthorShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 165.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColor.greyScale100,
                      highlightColor: Colors.white,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
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
                  ],
                ),
              );
            }));
  }
}
