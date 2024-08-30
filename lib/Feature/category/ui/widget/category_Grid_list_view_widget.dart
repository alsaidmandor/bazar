import 'package:bazaar/Feature/feed/data/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import 'category_item_widget.dart';

class CategoryGridListViewWidget extends StatelessWidget {

  final BooksModel bookModel ;
  const CategoryGridListViewWidget({super.key, required this.bookModel, });
  // final Axis scrollDirection ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 165.h,
      child: GridView.builder(physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: bookModel.items!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {

                debugPrint('print Id of book : ');
              },
              child: CategoryItemWidget(model: bookModel.items![index],));
        },

      ),
    );
  }
}
