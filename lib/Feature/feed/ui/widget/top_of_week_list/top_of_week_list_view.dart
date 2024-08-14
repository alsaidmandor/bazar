import 'package:bazaar/Feature/feed/logic/feed_cubit.dart';
import 'package:bazaar/Feature/feed/ui/widget/top_of_week_list/top_of_week_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/books_model.dart';

class TopOfWeekListView extends StatefulWidget {
  final BooksModel bookModel;
  const TopOfWeekListView({super.key, required this.bookModel});

  @override
  _TopOfWeekListViewState createState() => _TopOfWeekListViewState();
}

class _TopOfWeekListViewState extends State<TopOfWeekListView> {
  var selectedBookIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          var item = widget.bookModel.items![index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBookIndex = index;
              });
              context.read<FeedCubit>().getBooksDetails(
                    id: widget.bookModel.items![index].id!,
                  );
            },
            child: TopOfWeekListViewItem(
              imageUri: item.volumeInfo!.imageLinks!.smallThumbnail!,
              title: item.volumeInfo!.title!,
              price: item.saleInfo!.saleability!,
              countryCode: item.saleInfo!.country!,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(10);
        },
      ),
    );
  }
}
