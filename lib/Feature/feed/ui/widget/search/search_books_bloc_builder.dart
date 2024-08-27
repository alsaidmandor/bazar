import 'package:bazaar/Feature/feed/ui/widget/search/search_books_shimmer_loading.dart';
import 'package:bazaar/Feature/feed/ui/widget/search/search_empty.dart';
import 'package:bazaar/Feature/feed/ui/widget/search/search_list_view.dart';
import 'package:bazaar/core/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../../logic/feed_cubit.dart';

class SearchBooksBlocBuilder extends StatelessWidget {
  const SearchBooksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      buildWhen: (previous, current) =>
      current is SearchBooksLoading ||
          current is SearchBooksSuccess ||
          current is SearchBooksError,
      builder: (context, state) {
        return state.maybeWhen(
            searchBooksLoading: () {
              return setupLoading();
            },
            searchBooksSuccess: (response) {
              return setupSuccess(response, context);
            },
            searchBooksError: (errorHandler) => setupError(),
            orElse: () {
              return const Expanded(
                child: Center(
                  child: Text('Not fount thing ! ..'),
                ),
              );
            });
      },
    );
  }

  Widget setupLoading() {
    return const Expanded(child: SearchBooksShimmerLoading());
  }

  Widget setupSuccess(books, BuildContext context) {
    return
    Expanded(
        child: SearchListView(model: books));
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
