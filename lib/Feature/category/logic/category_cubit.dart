import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_handler.dart';
import '../../feed/data/model/books_model.dart';
import '../../feed/data/repo/feed_repo.dart';

part 'category_state.dart';

part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final FeedRepo _feedRepo;

  CategoryCubit(this._feedRepo) : super(const CategoryState.initial());

//    emit all Category
  Future<void> getGetAllCategories() async {
    emit(const CategoryState.allCategoryLoading());
    final response = await _feedRepo.searchBooks(search: 'All');
    response.when(
      success: (data) {
        emit(CategoryState.allCategorySuccess(data));
        debugPrint('show me success data of All categories book  : $data');
      },
      failure: (errorHandler) {
        debugPrint(
            'show me failure data of All categories book  : $errorHandler');
        emit(CategoryState.allCategoryError(errorHandler));
      },
    );
  }

//   emit novels category
  Future<void> getNovelsCategories() async {
    emit(const CategoryState.novelsCategoryLoading());
    final response = await _feedRepo.searchBooks(search: 'Novels');
    response.when(
      success: (data) {
        emit(CategoryState.novelsCategorySuccess(data));
        debugPrint('show me success data of Novels categories book  : $data');
      },
      failure: (errorHandler) {
        debugPrint(
            'show me failure data of Novels categories book  : $errorHandler');
        emit(CategoryState.novelsCategoryError(errorHandler));
      },
    );
  }

//   emit selfLove
  Future<void> getSelfLoveCategories() async {
    emit(const CategoryState.selfLoveCategoryLoading());
    final response = await _feedRepo.searchBooks(search: 'Self-Love');
    response.when(
      success: (data) {
        emit(CategoryState.selfLoveCategorySuccess(data));
        debugPrint(
            'show me success data of Self-Love categories book  : $data');
      },
      failure: (errorHandler) {
        debugPrint(
            'show me failure data of Self-Love categories book  : $errorHandler');
        emit(CategoryState.selfLoveCategoryError(errorHandler));
      },
    );
  }

//   emit science
  Future<void> getScienceCategories() async {
    emit(const CategoryState.scienceCategoryLoading());
    final response = await _feedRepo.searchBooks(search: 'Science');
    response.when(
      success: (data) {
        emit(CategoryState.scienceCategorySuccess(data));
        debugPrint('show me success data of Science categories book  : $data');
      },
      failure: (errorHandler) {
        debugPrint(
            'show me failure data of Science categories book  : $errorHandler');
        emit(CategoryState.scienceCategoryError(errorHandler));
      },
    );
  }

//   emit romantic
  Future<void> getRomanticCategories() async {
    emit(const CategoryState.romanticCategoryLoading());
    final response = await _feedRepo.searchBooks(search: 'Romance');
    response.when(
      success: (data) {
        emit(CategoryState.romanticCategorySuccess(data));
        debugPrint('show me success data of Romantic categories book  : $data');
      },
      failure: (errorHandler) {
        debugPrint(
            'show me failure data of Romantic categories book  : $errorHandler');
        emit(CategoryState.romanticCategoryError(errorHandler));
      },
    );
  }
}
