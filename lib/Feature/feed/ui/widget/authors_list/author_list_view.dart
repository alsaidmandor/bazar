import 'package:bazaar/Feature/feed/ui/widget/authors_list/author_item.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../data/model/literary_figure.dart';

class AuthorListView extends StatelessWidget {

  final Axis scrollDirection ;
  final List<LiteraryFigure> literaryFigures;

  final bool isLengthList;
  const AuthorListView({super.key,  this.scrollDirection=Axis.vertical, required this.literaryFigures,  this.isLengthList=true});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        itemCount: isLengthList ?  4 : literaryFigures.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {

                debugPrint('print Id of book : ');
                context.pushNamed(Routes.authorsDetailsScreen,arguments: literaryFigures[index]);
              },
              child: AuthorItem(literaryFigure: literaryFigures[index] , isFeed: isLengthList,));
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(10);
        },
      ),
    );
  }
}
