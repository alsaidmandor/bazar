import 'package:bazaar/Feature/category/ui/widget/romantic_category/romantic_categories_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category_cubit.dart';

class RomanticCategoryWidget extends StatefulWidget {
  const RomanticCategoryWidget({super.key});

  @override
  State<RomanticCategoryWidget> createState() => _RomanticCategoryWidgetState();
}

class _RomanticCategoryWidgetState extends State<RomanticCategoryWidget> {

  @override
  void initState() {
    context.read<CategoryCubit>().getRomanticCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RomanticCategoriesBlocBuilder();
  }
}
