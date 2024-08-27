import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../model/book_details_response.dart';
import '../model/books_model.dart';
import 'feed_api_constant.dart';

part 'feed_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FeedApiService {
  factory FeedApiService(Dio dio, {String baseUrl}) = _FeedApiService;

  // @GET(FeedApiConstants.detailsBook)
  @GET("/volumes/{id}")
  Future<BookDetailsResponse> getBookById(@Path("id") String id);

  @GET(FeedApiConstants.fictionBook)
  Future<BooksModel> getBooks(
    @Query("q") String query,
    @Query("maxResults") int maxResults,
  );

  @GET(FeedApiConstants.fictionBook)
  Future<BooksModel> searchBooks(
      @Query("q") String query,
      @Query("maxResults") int maxResults,
      );
}
