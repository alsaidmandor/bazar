import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';

class AllAuthorsList extends StatelessWidget {
  const AllAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: literaryFigures.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedAuthorIndex = index;
              // });
              debugPrint('print Id of book : ');
            },
            child: AuthorItem(
              imagePath: literaryFigures[index].imageUrl,
              name: literaryFigures[index].name,
              description: literaryFigures[index].description,
              isFeed: false,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    );
  }
}
