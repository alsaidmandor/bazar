import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';

class NovelistsAuthorsList extends StatelessWidget {
  const NovelistsAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return     ListView.separated(
      itemCount: novelists.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedAuthorIndex = index;
              // });
              debugPrint('print Id of book : ');
            },
            child: AuthorItem(
              imagePath: novelists[index].imageUrl,
              name: novelists[index].name,
              description: novelists[index].description,
              isFeed: false,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    );
  }
}
