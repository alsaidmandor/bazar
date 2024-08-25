import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/literary_figure.dart';
import 'author_item.dart';

class PoetsAuthorsList extends StatelessWidget {
  const PoetsAuthorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     ListView.separated(
      itemCount: poets.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // setState(() {
              //   selectedAuthorIndex = index;
              // });
              debugPrint('print Id of book : ');
            },
            child: AuthorItem(
              imagePath: poets[index].imageUrl,
              name: poets[index].name,
              description: poets[index].description,
              isFeed: false,));
      },
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    );

  }
}
