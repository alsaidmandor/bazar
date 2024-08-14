import 'package:bazaar/Feature/feed/ui/widget/top_of_week_list/top_of_week_bloc_builder.dart';
import 'package:bazaar/core/theme/icon_broken.dart';
import 'package:bazaar/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';

final List<String> images = [
  Assets.imagesBook1,
  'assets/images/book2.png',
  'assets/images/book3.png',
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dio dio = DioFactory.getDio();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.only(left: 20.w),
              // Adjust padding as needed
              onPressed: () {},
              icon: const Icon(
                IconBroken.Search,
                color: AppColor.greyScale900,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(right: 20.w),
              // Adjust padding as needed
              icon: const Icon(
                IconBroken.Notification,
                color: AppColor.greyScale900,
              ),
            )
          ],
          title: Text(
            'Home',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontHeading20BlackBold),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: const SingleChildScrollView(
            child: TopOfWeekBlocBuilder(),
          ),
        ));
  }
}
