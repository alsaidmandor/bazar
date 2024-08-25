import 'package:bazaar/Feature/feed/ui/widget/authors_list/all_authors_list.dart';
import 'package:bazaar/Feature/feed/ui/widget/authors_list/journalists_authors_list.dart';
import 'package:bazaar/Feature/feed/ui/widget/authors_list/novelists_authors_list.dart';
import 'package:bazaar/Feature/feed/ui/widget/authors_list/playwrights_authors_list.dart';
import 'package:bazaar/Feature/feed/ui/widget/authors_list/poets_authors_list.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:bazaar/core/helper/spacing.dart';
import 'package:bazaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/icon_broken.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> with SingleTickerProviderStateMixin {

  final tabs = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Poets',
    ),
    Tab(
      text: 'Playwrights',
    ),
    Tab(
      text: 'Novelists',
    ),
    Tab(
      text: 'Journalists',
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
      appBar: CustomAppBar(
        leadingIcon: IconBroken.Arrow___Left,
        onLeadingIconPressed: () {
          context.pop();
        },
        leadingPadding: EdgeInsets.only(left: 20.w),
        actionIcon: IconBroken.Search,
        onActionIconPressed: () {},
        actionPadding: EdgeInsets.only(right: 20.w),
        titleText: 'Authors',
        titleStyle:
            GoogleFonts.openSans(textStyle: TextStyles.fontHeading20BlackBold),
      ),
      body: Container(
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
            Text(
              'Check the authors',
              style: TextStyles.fontBody16BlackRegular
                  .copyWith(color: AppColor.greyScale500),
            ),
            verticalSpace(12),
            Text(
              'Authors',
              style: TextStyles.fontHeading20BlackBold
                  .copyWith(color: AppColor.primary500),
            ),
            verticalSpace(12),
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
                children: const [
                  AllAuthorsList(),
                  PoetsAuthorsList(),
                  PlaywrightsAuthorsList(),
                  NovelistsAuthorsList(),
                  JournalistsAuthorsList()

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
