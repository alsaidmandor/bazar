import 'package:bazaar/Feature/category/logic/category_cubit.dart';
import 'package:bazaar/Feature/category/ui/widget/category_Grid_list_view_widget.dart';
import 'package:bazaar/Feature/feed/data/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category_empty.dart';
import '../category_shimmer_loading.dart';

class SelfLoveCategoriesBlocBuilder extends StatelessWidget {
  const SelfLoveCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is SelfLoveCategoryLoading ||
          current is SelfLoveCategorySuccess ||
          current is SelfLoveCategoryError,
      builder: (context, state) {
        return state.maybeWhen(
          selfLoveCategoryLoading: () {
            return const CategoryShimmerLoading();
          },
          selfLoveCategorySuccess: (response) {
            return setupSuccess(response, context);
          },
         selfLoveCategoryError: (errorHandler) {
            return setupError();
          },
          orElse: () {
            return setupError();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const CategoryShimmerLoading();
  }

  Widget setupSuccess(BooksModel books, BuildContext context) {
    return CategoryGridListViewWidget(
      bookModel: books,
    );
  }

  Widget setupError() {
    return const CategoryEmpty();
  }
}
