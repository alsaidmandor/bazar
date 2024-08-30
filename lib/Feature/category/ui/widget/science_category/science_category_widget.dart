import 'package:bazaar/Feature/category/ui/widget/science_category/science_categories_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category_cubit.dart';

class ScienceCategoryWidget extends StatefulWidget {
  const ScienceCategoryWidget({super.key});

  @override
  State<ScienceCategoryWidget> createState() => _ScienceCategoryWidgetState();
}

class _ScienceCategoryWidgetState extends State<ScienceCategoryWidget> {


  @override
  void initState() {
    context.read<CategoryCubit>().getScienceCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScienceCategoriesBlocBuilder();
  }
}
