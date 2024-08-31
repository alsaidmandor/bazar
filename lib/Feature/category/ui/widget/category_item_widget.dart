import 'package:bazaar/Feature/feed/data/model/books_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/utils/constants.dart';

class CategoryItemWidget extends StatelessWidget {
  final Item model ;
  const CategoryItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 230.h,
      width: 158.w,

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: model.volumeInfo?.imageLinks?.thumbnail ?? defaultBook,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 158.w,
                    height: 120.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColor.white,
                    ),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                width: 158.w,
                height: 120.h,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) {
                return Container(
                  width: 158.w,
                  height: 120.h,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/book3.png'), // Ensure this asset exists
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ), // verticalSpace(20),
          Text(model.volumeInfo!.title!,
              style: TextStyles.fontBody14BlackMedium
                  .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
              overflow: TextOverflow.ellipsis),
          // verticalSpace(2),
          Text(
            model.saleInfo!.saleability!,
            style: TextStyles.fontBody12BlackBold
                .copyWith(color: AppColor.primary500, height: 1.5),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

  }
}
