import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/icon_broken.dart';

class BookDetailsShimmerLoading extends StatelessWidget {
  const BookDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        20.0,
        16.0,
        20.0,
        28.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Shimmer.fromColors(
              baseColor: AppColor.greyScale100,
              highlightColor: AppColor.white,
              child: Container(
                width: 200.w,
                height: 250.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          verticalSpace(16),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: Colors.white,
            child: Container(
              height: 21.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: AppColor.greyScale100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(16),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: AppColor.white,
            child: Container(
              width: 110.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
            ),
          ),
          verticalSpace(12),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: Colors.white,
            child: Container(
              height: 18.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.greyScale100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(16),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: Colors.white,
            child: Container(
              height: 18.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: AppColor.greyScale100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(12),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: Colors.white,
            child: Container(
              height: 18.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.greyScale100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(16),
          Shimmer.fromColors(
            baseColor: AppColor.greyScale100,
            highlightColor: Colors.white,
            child: Container(
              height: 18.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: AppColor.greyScale100,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          verticalSpace(24),
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
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const Icon(
                    IconBroken.Star,
                    color: AppColor.white,
                  )),
              Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const Icon(
                    IconBroken.Star,
                    color: AppColor.white,
                  )),
              Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const Icon(
                    IconBroken.Star,
                    color: AppColor.white,
                  )),
              Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const Icon(
                    IconBroken.Star,
                    color: AppColor.white,
                  )),
              Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: AppColor.white,
                  child: const Icon(
                    IconBroken.Star,
                    color: AppColor.white,
                  )),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                ),
              ),
              horizontalSpace(10),
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: Container(
                  height: 25.h,
                  width: 18.w,
                  decoration: BoxDecoration(
                    color: AppColor.greyScale100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              horizontalSpace(10),
              Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColor.greyScale100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColor.greyScale100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
