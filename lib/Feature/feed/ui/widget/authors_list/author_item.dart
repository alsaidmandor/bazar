import 'package:bazaar/core/helper/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../data/model/literary_figure.dart';

class AuthorItem extends StatelessWidget {
final LiteraryFigure literaryFigure;

  final bool isFeed;

  const AuthorItem({
    super.key,

    this.isFeed = true,
    required this.literaryFigure,
  });

  @override
  Widget build(BuildContext context) {
    return isFeed ? SizedBox(
      width: 80.w,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.greyScale100,
              child: CachedNetworkImage(
                imageUrl:
                literaryFigure.imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Shimmer.fromColors(
                    baseColor: AppColor.greyScale100,
                    highlightColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageProvider,
                    ),
              ),
            ),

            // verticalSpace(20),
            Text(literaryFigure.name,
                style: TextStyles.fontBody14BlackMedium
                    .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis),
            Text(
               literaryFigure.title,
              style: TextStyles.fontBody12BlackBold
                  .copyWith(color: AppColor.greyScale500, height: 1.5),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ],
        ),
    ) : SizedBox(
      height: 80.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.greyScale100,
              child: CachedNetworkImage(
                imageUrl:
                literaryFigure.imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Shimmer.fromColors(
                    baseColor: AppColor.greyScale100,
                    highlightColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageProvider,
                    ),
              ),
            ),
            // verticalSpace(20),
            horizontalSpace(12),
            SizedBox(
              width: 200.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(literaryFigure.name,
                      style: TextStyles.fontBody14BlackMedium
                          .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                  Text(
                    literaryFigure.description ,
                    style: TextStyles.fontBody12BlackBold
                        .copyWith(color: AppColor.greyScale500, height: 1.5),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),

                ],
              ),
            ),
          ],

            ),
      );
  }
}
