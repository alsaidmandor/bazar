import 'package:bazaar/Feature/feed/logic/feed_cubit.dart';
import 'package:bazaar/Feature/feed/ui/widget/top_of_week_list/top_of_week_list_view.dart';
import 'package:bazaar/Feature/feed/ui/widget/top_of_week_list/top_of_week_shimmer_loading.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../feed_screen.dart';
import '../authors_list/author_list_view.dart';
import '../authors_list/author_shimmer_loading.dart';
import '../best_vendors_list/best_vendors_list_view.dart';
import '../best_vendors_list/best_vendors_shimmer_loading.dart';
import '../carouel_slide_shimmer_loading.dart';
import '../carousel_slider_widget.dart';
import '../see_all_shimmer_loading.dart';
import '../see_all_widget.dart';

class TopOfWeekBlocBuilder extends StatelessWidget {
  const TopOfWeekBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      buildWhen: (previous, current) =>
          current is BooksTopWeekLoading ||
          current is BooksTopWeekSuccess ||
          current is BooksTopWeekError,
      builder: (context, state) {
        return state.maybeWhen(
            booksTopWeekLoading: () {
              return setupLoading();
            },
            booksTopWeekSuccess: (response) {
              return setupSuccess(response , context);
            },
            booksTopWeekError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return Column(
      children: [
        const CarouelSlideShimmerLoading(),
        verticalSpace(13),
        const SeeAllShimmerLoading(),
        verticalSpace(16),
        const TopOfWeekShimmerLoading(),
        verticalSpace(16),
        const SeeAllShimmerLoading(),
        verticalSpace(16),
        const BestVendorsShimmerLoading(),
        verticalSpace(16),
        const AuthorShimmerLoading()
      ],
    );
  }

  Widget setupSuccess(books, BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(image: images),
        verticalSpace(13),
        SeeAllWidget(
          title: 'Top of Week',
          onPress: () {
            debugPrint('See All');
          },
        ),
        verticalSpace(16),
        TopOfWeekListView(
          bookModel: books,
        ),
        verticalSpace(16),
        SeeAllWidget(
          title: 'Best Vendors',
          onPress: () {
            debugPrint('See All');
          },
        ),
        verticalSpace(16),
        const BestVendorsListView(),
        verticalSpace(16),
        SeeAllWidget(
          title: 'Authors',
          onPress: () {
            debugPrint('See All');
            context.pushNamed(Routes.authorsScreen);
          },
        ),
        verticalSpace(16),
        const AuthorListView()
      ],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
