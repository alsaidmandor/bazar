import 'package:bazaar/Feature/feed/ui/widget/search/search_books_bloc_builder.dart';
import 'package:bazaar/Feature/feed/ui/widget/search/search_books_shimmer_loading.dart';
import 'package:bazaar/Feature/feed/ui/widget/search/search_form.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/icon_broken.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';

class SearchBooksScreen extends StatelessWidget {
  const SearchBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconBroken.Arrow___Left,
        onLeadingIconPressed: () {
          context.pop();
        },
        leadingPadding: EdgeInsets.only(left: 20.w),

        titleText: 'Search',
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
        child: const Column(
          children: [
            SearchForm(),
            SearchBooksBlocBuilder()
          ],
        ),
      ),
    );
  }
}
