import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/feed_api_service.dart';
import '../model/book_details_response.dart';
import '../model/books_model.dart';

class FeedRepo {
  final FeedApiService _feedApiService;

  FeedRepo(this._feedApiService);

  Future<ApiResult<BooksModel>> getBooks() async {
    try {
      final response = await _feedApiService.getBooks("amine", 30);
      // print('show me success data response of book : $response');
      return ApiResult.success(response);
    } catch (error,stacktrace ) {
    FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BookDetailsResponse>> getBooksDetails({required String id}) async {
    try {
      final response = await _feedApiService.getBookById(id);
      return ApiResult.success(response);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BooksModel>> searchBooks({required String search}) async {
    try {
      final response = await _feedApiService.searchBooks(search, 38);
      return ApiResult.success(response);
    } catch (error,stacktrace ) {
      FirebaseCrashlytics.instance.recordError(error, stacktrace);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
