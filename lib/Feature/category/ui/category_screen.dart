import 'package:bazaar/Feature/category/ui/widget/allCategories/all_category_widget.dart';
import 'package:bazaar/Feature/category/ui/widget/novels_category/novels_category_widget.dart';
import 'package:bazaar/Feature/category/ui/widget/romantic_category/romantic_category_widget.dart';
import 'package:bazaar/Feature/category/ui/widget/science_category/science_category_widget.dart';
import 'package:bazaar/Feature/category/ui/widget/selflove_category/self_love_category_widget.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/theme/styles.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {

  final tabs = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Novels',
    ),
    Tab(
      text: 'Self Love',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Romantic',
    ),
  ];
  late TabController tabController;
  @override
  void initState() {
    tabController =TabController(length:5 , vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.only(left: 20.w),
            // Adjust padding as needed
            onPressed: () {
              context.pushNamed(Routes.searchBooksScreen);
            },
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
          'Category',
          style: GoogleFonts.openSans(
              textStyle: TextStyles.fontHeading20BlackBold),
        ),
      ),
      body:  Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(
          20.0,
          16.0,
          20.0,
          28.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              controller: tabController,
              tabs: tabs,
              labelColor: AppColor.greyScale900,
              indicatorColor: AppColor.primary500,
              unselectedLabelColor: AppColor.greyScale500,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
            ),
            verticalSpace(20),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  const [
               AllCategoryWidget(),
                  NovelsCategoryWidget(),
                  SelfLoveCategoryWidget(),
                  ScienceCategoryWidget(),
                  RomanticCategoryWidget(),

                ],
              ),
            ),          ],
        ),
      ),
    );
  }
}
