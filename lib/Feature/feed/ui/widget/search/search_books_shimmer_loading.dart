import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';

class SearchBooksShimmerLoading extends StatelessWidget {
  const SearchBooksShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            margin:
            const EdgeInsets.fromLTRB(
              20.0,
              5.0,
              20.0,
              5.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                horizontalSpace(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: AppColor.greyScale100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
