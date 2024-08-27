import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/model/book_details_response.dart';
import '../data/model/books_model.dart';
import '../data/repo/feed_repo.dart';

part 'feed_cubit.freezed.dart';
part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final FeedRepo _feedRepo;

  FeedCubit(this._feedRepo) : super(const FeedState.initial());

  TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> getBooksTopWeek() async {
    emit(const FeedState.booksTopWeekLoading());
    final response = await _feedRepo.getBooks();
    response.when(
      success: (response) {
        emit(FeedState.booksTopWeekSuccess(response));
        debugPrint('show me success data of book :${response.items![0].id}');
      },
      failure: (errorHandler) {
        emit(FeedState.booksTopWeekError(errorHandler));
        debugPrint(
            'show me failure data of book : ${errorHandler.apiErrorModel.message}');
      },
    );
/*    try {
      emit(FeedState.booksTopWeekSuccess(response));
      debugPrint('show me success data of book : ${response.items![0].id}');
    } catch (e) {
      emit(FeedState.booksTopWeekError(e.toString() as ErrorHandler));
      debugPrint('show me failure data of book : ${e.toString()}');
    }*/
  }

  bool isSuccess = false;
  Future<void> getBooksDetails({required String id}) async {
    emit(const FeedState.booksDetailsLoading());
    final response = await _feedRepo.getBooksDetails(id: id);
    response.when(
      success: (data) {
        emit(FeedState.booksDetailsSuccess(data));
        isSuccess = true;
        debugPrint('show me success data of book details : $data');
      },
      failure: (errorHandler) {
        debugPrint('show me failure data of book details : $errorHandler');
        emit(FeedState.booksDetailsError(errorHandler));
      },
    );
  }
  Future<void> getSearchBooks({required String search}) async {
    emit(const FeedState.searchBooksLoading());
    final response = await _feedRepo.searchBooks(search: search);
    response.when(
      success: (data) {
        emit(FeedState.searchBooksSuccess(data));
        isSuccess = true;
        debugPrint('show me success data of search book  : $data');
      },
      failure: (errorHandler) {
        debugPrint('show me failure data of search book  : $errorHandler');
        emit(FeedState.searchBooksError(errorHandler));
      },
    );
  }
}
