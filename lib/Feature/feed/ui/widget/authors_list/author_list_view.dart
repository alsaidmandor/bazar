import 'package:bazaar/Feature/feed/ui/widget/authors_list/author_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';

class AuthorListView extends StatefulWidget {
  const AuthorListView({super.key});

  @override
  _AuthorListViewState createState() => _AuthorListViewState();
}

class _AuthorListViewState extends State<AuthorListView> {
  var selectedAuthorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedAuthorIndex = index;
                });
                debugPrint('print Id of book : ');
              },
              child: AuthorItem(imagePath: literaryFigures[index].imageUrl,name: literaryFigures[index].name,));
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(10);
        },
      ),
    );
  }
}
