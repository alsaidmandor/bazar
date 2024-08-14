import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> image;

  const CarouselSliderWidget({super.key, required this.image});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: CarouselSlider(
            items: widget.image
                .map(
                  (e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.greyScale50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Special Offer',
                                    style: TextStyles.fontHeading20BlackBold),
                                Text('Discount 25%',
                                    style: TextStyles.fontBody14BlackRegular),
                                verticalSpace(15),
                                AppTextButton(
                                  buttonText: 'Order Now',
                                  textStyle: TextStyles.fontBody14BlackBold
                                      .copyWith(color: AppColor.white),
                                  onPressed: () {},
                                  buttonWidth: 120,
                                  borderRadius: 24,
                                  buttonHeight: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                        // horizontalSpace(10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(e),
                              fit: BoxFit.contain,
                              height: 145,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPosition = index;
                  });
                }),
          ),
        ),
        verticalSpace(10),
        DotsIndicator(
          dotsCount: widget.image.length,
          position: currentPosition,
          decorator: const DotsDecorator(
            color: AppColor.greyScale500, // Inactive color
            activeColor: AppColor.primary500,
            size: Size(5, 5),
          ),
        )
      ],
    );
  }
}
