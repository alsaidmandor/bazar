import 'package:bazaar/core/theme/colors.dart';
import 'package:bazaar/core/theme/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TopOfWeekListViewItem extends StatelessWidget {
  final String imageUri;
  final String title;
  final String price;
  final String countryCode;

  const TopOfWeekListViewItem(
      {super.key,
      required this.imageUri,
      required this.title,
      required this.price,
      required this.countryCode});

  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: imageUri,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: AppColor.greyScale100,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColor.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ), // verticalSpace(20),
          Text(title,
              style: TextStyles.fontBody14BlackMedium
                  .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
              overflow: TextOverflow.ellipsis),
          Text(
            '${countryCode} ${price} ',
            style: TextStyles.fontBody12BlackBold
                .copyWith(color: AppColor.primary500, height: 1.5),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
