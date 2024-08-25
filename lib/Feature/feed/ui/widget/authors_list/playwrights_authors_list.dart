import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';

class PlaywrightsAuthorsList extends StatelessWidget {
  const PlaywrightsAuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return     ListView.separated(
      itemCount: playwrights.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedAuthorIndex = index;
              // });
              debugPrint('print Id of book : ');
            },
            child: AuthorItem(
              imagePath: playwrights[index].imageUrl,
              name: playwrights[index].name,
              description: playwrights[index].description,
              isFeed: false,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    );
  }
}
