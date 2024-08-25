import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';

class JournalistsAuthorsList extends StatelessWidget {
  const JournalistsAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return     ListView.separated(
      itemCount: journalists.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedAuthorIndex = index;
              // });
              debugPrint('print Id of book : ');
            },
            child: AuthorItem(
              imagePath: journalists[index].imageUrl,
              name: journalists[index].name,
              description: journalists[index].description,
              isFeed: false,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    );
  }
}
