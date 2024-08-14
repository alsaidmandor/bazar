part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;

  // Get Books Top Week
  const factory FeedState.booksTopWeekLoading() = BooksTopWeekLoading;
  const factory FeedState.booksTopWeekSuccess(BooksModel response) =
      BooksTopWeekSuccess;
  const factory FeedState.booksTopWeekError(ErrorHandler errorHandler) =
      BooksTopWeekError;

// Get Book Details
  const factory FeedState.booksDetailsLoading() = BooksDetailsLoading;
  const factory FeedState.booksDetailsSuccess(BookDetailsResponse response) =
      BooksDetailsSuccess;
  const factory FeedState.booksDetailsError(ErrorHandler errorHandler) =
      BooksDetailsError;
}
