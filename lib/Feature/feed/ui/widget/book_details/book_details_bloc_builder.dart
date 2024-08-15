import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/feed_cubit.dart';
import 'book_details.dart';
import 'book_details_shimmer_loading.dart';

class BookDetailsBlocBuilder extends StatelessWidget {
  const BookDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      buildWhen: (previous, current) =>
          current is BooksDetailsLoading ||
          current is BooksDetailsSuccess ||
          current is BooksDetailsError,
      builder: (BuildContext context, FeedState state) {
        return state.maybeWhen(
          booksDetailsLoading: () {
            return setupLoading();
          },
          booksDetailsSuccess: (response) {
            return setupSuccess(response);
          },
          booksDetailsError: (errorHandler) {
            return setupError();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const BookDetailsShimmerLoading();
  }

  Widget setupSuccess(books) {
    return BookDetails(
      bookDetailsResponse: books,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
