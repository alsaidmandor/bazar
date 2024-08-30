import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category_cubit.dart';
import 'novels_categories_bloc_builder.dart';

class NovelsCategoryWidget extends StatefulWidget {
  const NovelsCategoryWidget({super.key});

  @override
  State<NovelsCategoryWidget> createState() => _NovelsCategoryWidgetState();
}

class _NovelsCategoryWidgetState extends State<NovelsCategoryWidget> {

  @override
  void initState() {
    context.read<CategoryCubit>().getNovelsCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NovelsCategoriesBlocBuilder();
  }
}
