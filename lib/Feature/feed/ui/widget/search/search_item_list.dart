import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../data/model/book_details_response.dart';

class SearchItemList extends StatelessWidget {

  final String?  imagePath ;
  final String  title ;
  final String  description ;
  const SearchItemList({super.key, required this.imagePath, required this.title, required this.description, });

  @override
  Widget build(BuildContext context) {
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
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.greyScale100,
            child: CachedNetworkImage(
              imageUrl:imagePath!,
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
                Text(title,
                    style: TextStyles.fontBody14BlackMedium
                        .copyWith(height: 1.5, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
                Text(
                   '',
                  style: TextStyles.fontBody12BlackBold
                      .copyWith(color: AppColor.greyScale500, height: 1.5),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),

              ],
            ),
          ),
        ],

      ),
    );
  }
}
