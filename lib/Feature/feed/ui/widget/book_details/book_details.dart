import 'package:bazaar/Feature/feed/ui/widget/best_vendors_list/best_vendors_list_view.dart';
import 'package:bazaar/core/theme/styles.dart';
import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/widgets/svg_image.dart';
import '../../../data/model/book_details_response.dart';

class BookDetails extends StatefulWidget {
  final BookDetailsResponse bookDetailsResponse;

  const BookDetails({super.key, required this.bookDetailsResponse});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    String? largeImage =
        widget.bookDetailsResponse.volumeInfo!.imageLinks!.large!;
    String? smallImage =
        widget.bookDetailsResponse.volumeInfo!.imageLinks!.thumbnail!;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        20.0,
        16.0,
        20.0,
        28.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl: largeImage ?? smallImage,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 200.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColor.white,
                    ),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                width: 200.w,
                height: 250.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ), // verticalSpace(20),,
          ),
          verticalSpace(16),
          Text(
            widget.bookDetailsResponse.volumeInfo!.title!,
            style: TextStyles.fontHeading20BlackBold,
          ),
          verticalSpace(16),
          SvgImage(
            assetPath: vendorList[3].imagePath,
            fit: BoxFit.contain,
          ),
          verticalSpace(16),
          Text(
            widget.bookDetailsResponse.volumeInfo!.description! ?? "",
            textAlign: TextAlign.center,
            maxLines: 6,
            style: TextStyles.fontBody14BlackRegular
                .copyWith(color: AppColor.greyScale500),
          ),
          verticalSpace(16),
          Text(
            'Review',
            style: TextStyles.fontHeading16BlackBold,
          ),
          verticalSpace(8),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 18,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColor.yellow,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          verticalSpace(16),
          Row(
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: AppColor.greyScale200,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 0.6,
                  icon: const Icon(
                    Icons.remove,
                    color: AppColor.primary500,
                  ),
                  onPressed: () {
                    setState(() {
                      price--;
                    });
                  },
                ),
              ),
              horizontalSpace(20),
              Text('$price'),
              horizontalSpace(20),
              Ink(
                decoration: const ShapeDecoration(
                  color: AppColor.primary500,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 0.6,
                  icon: const Icon(
                    Icons.add,
                    color: AppColor.white,
                  ),
                  onPressed: () {
                    setState(() {
                      price++;
                    });
                  },
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppTextButton(
                    buttonText: 'Continue shopping',
                    textStyle: TextStyles.fontHeading18BlackBold
                        .copyWith(color: AppColor.white),
                    onPressed: () {}),
              ),
              horizontalSpace(20),
              Expanded(
                child: AppTextButton(
                    buttonText: 'View cart',
                    textStyle: TextStyles.fontHeading18BlackBold
                        .copyWith(color: AppColor.primary500),
                    backgroundColor: AppColor.greyScale50,
                    onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}
