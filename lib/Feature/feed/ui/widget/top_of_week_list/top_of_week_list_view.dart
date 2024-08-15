import 'package:bazaar/Feature/feed/logic/feed_cubit.dart';
import 'package:bazaar/Feature/feed/ui/widget/top_of_week_list/top_of_week_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../data/model/books_model.dart';
import '../book_details/book_details_bloc_builder.dart';

class TopOfWeekListView extends StatefulWidget {
  final BooksModel bookModel;
  const TopOfWeekListView({super.key, required this.bookModel});

  @override
  _TopOfWeekListViewState createState() => _TopOfWeekListViewState();
}

class _TopOfWeekListViewState extends State<TopOfWeekListView>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(seconds: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              debugPrint('print Id of book : ${item.id!}');
              context.read<FeedCubit>().getBooksDetails(
                    id: item.id!,
                  );
              _showFullScreenModal(context);
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

  void _showFullScreenModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      useSafeArea: true,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5.h,
              width: 50.w,
              margin: EdgeInsets.only(top: 20.h),
              decoration: BoxDecoration(
                color: AppColor.greyScale200,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const BookDetailsBlocBuilder(),
          ],
        );
      },
    );
  }
}
