import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class AuthorItem extends StatelessWidget {
  const AuthorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      width: 100.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.greyScale100,
            child: CachedNetworkImage(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/4/45/John_freeman_3280332.jpg',
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
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 50,
                backgroundImage: imageProvider,
              ),
            ),
          ), // verticalSpace(20),
          Text('John Freeman',
              style: TextStyles.fontBody14BlackMedium
                  .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis),
          Text(
            ' writer',
            style: TextStyles.fontBody12BlackBold
                .copyWith(color: AppColor.greyScale500, height: 1.5),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
