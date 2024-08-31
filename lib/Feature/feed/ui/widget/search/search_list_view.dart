import 'package:bazaar/Feature/feed/ui/widget/search/search_item_list.dart';
import 'package:bazaar/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/model/books_model.dart';

class SearchListView extends StatelessWidget {

  final BooksModel model ;
  const SearchListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: model.items!.length,
      itemBuilder: (context, index) {
        var item = model.items![index];
        return GestureDetector(
            onTap: () {},
            child:SearchItemList(model: item, ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(10);
      },
    );
  }
}
