import 'package:bazaar/core/helper/extensions.dart';
import 'package:bazaar/core/helper/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/icon_broken.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/model/literary_figure.dart';
import '../../feed_screen.dart';

class AuthorDetailsScreen extends StatelessWidget {
  final LiteraryFigure literaryFigure;

  const AuthorDetailsScreen({super.key, required this.literaryFigure});

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: CustomAppBar(   leadingIcon: IconBroken.Arrow___Left,
    onLeadingIconPressed: () {
      context.pop();
    },
    leadingPadding: EdgeInsets.only(left: 20.w), titleText: 'Authors',
    titleStyle:
    GoogleFonts.openSans(textStyle: TextStyles.fontHeading20BlackBold),
  ),
  body: Container(
    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(
      20.0,
      16.0,
      20.0,
      50.0,
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          verticalSpace(20),
          CircleAvatar(
            radius: 50,
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
          verticalSpace(10),
          Text(literaryFigure.title, style:     GoogleFonts.openSans(textStyle: TextStyles.fontBody16BlackRegular)),
          verticalSpace(10),
          Text(literaryFigure.name, style:     TextStyles.fontHeading20BlackBold),
          verticalSpace(20),
          RatingBar.builder(
            initialRating: literaryFigure.star,
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
          verticalSpace(20),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: GoogleFonts.openSans(textStyle: TextStyles.fontBody16BlackBold),
                ),
                verticalSpace(10),
                Text(literaryFigure.description, style:     GoogleFonts.openSans(textStyle: TextStyles.fontBody16BlackRegular)),
                verticalSpace(10),
                Text(
                  'Products',
                  style: GoogleFonts.openSans(textStyle: TextStyles.fontBody16BlackBold),
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140.w,
                      height: 155.h,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.greyScale50,
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer ,
                            child: Image(
                              image: AssetImage(images[1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          verticalSpace(10),
                          Text('The Da vinci Code', style:    TextStyles.fontBody16BlackMedium),
                          Text('\$ 25', style:    TextStyles.fontBody14BlackBold.copyWith(color: AppColor.primary500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 140.w,
                      height: 155.h,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.greyScale50,
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer ,
                            child: Image(
                              image: AssetImage(images[1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          verticalSpace(10),
                          Text('The Da vinci Code', style:    TextStyles.fontBody16BlackMedium),
                          Text('\$ 25', style:    TextStyles.fontBody14BlackBold.copyWith(color: AppColor.primary500)),
                        ],
                      ),
                    ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140.w,
                      height: 155.h,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.greyScale50,
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer ,
                            child: Image(
                              image: AssetImage(images[1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          verticalSpace(10),
                          Text('The Da vinci Code', style:    TextStyles.fontBody16BlackMedium),
                          Text('\$ 25', style:    TextStyles.fontBody14BlackBold.copyWith(color: AppColor.primary500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 140.w,
                      height: 155.h,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.greyScale50,
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer ,
                            child: Image(
                              image: AssetImage(images[1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          verticalSpace(10),
                          Text('The Da vinci Code', style:    TextStyles.fontBody16BlackMedium),
                          Text('\$ 25', style:    TextStyles.fontBody14BlackBold.copyWith(color: AppColor.primary500)),
                        ],
                      ),
                    ),
                    ]),


              ],
            ),
          )

        ],
      ),
    ),
  ),
);
}
}
