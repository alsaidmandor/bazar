part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;

  //  Get All Category

  const factory CategoryState.allCategoryLoading() = AllCategoryLoading;

  const factory CategoryState.allCategorySuccess(BooksModel response) =
      AllCategorySuccess;

  const factory CategoryState.allCategoryError(ErrorHandler errorHandler) =
      AllCategoryError;

//   Get Novels Category

  const factory CategoryState.novelsCategoryLoading() = NovelsCategoryLoading;

  const factory CategoryState.novelsCategorySuccess(BooksModel response) =
      NovelsCategorySuccess;

  const factory CategoryState.novelsCategoryError(ErrorHandler errorHandler) =
      NovelsCategoryError;

//   Get Romantic Category

  const factory CategoryState.romanticCategoryLoading() =
      RomanticCategoryLoading;

  const factory CategoryState.romanticCategorySuccess(BooksModel response) =
      RomanticCategorySuccess;

  const factory CategoryState.romanticCategoryError(ErrorHandler errorHandler) =
      RomanticCategoryError;

//   Get Science Category

  const factory CategoryState.scienceCategoryLoading() = ScienceCategoryLoading;

  const factory CategoryState.scienceCategorySuccess(BooksModel response) =
      ScienceCategorySuccess;

  const factory CategoryState.scienceCategoryError(ErrorHandler errorHandler) =
      ScienceCategoryError;

//   Get SelfLove Category

  const factory CategoryState.selfLoveCategoryLoading() =
      SelfLoveCategoryLoading;

  const factory CategoryState.selfLoveCategorySuccess(BooksModel response) =
      SelfLoveCategorySuccess;

  const factory CategoryState.selfLoveCategoryError(ErrorHandler errorHandler) =
      SelfLoveCategoryError;
}
