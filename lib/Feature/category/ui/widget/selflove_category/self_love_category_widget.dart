import 'package:bazaar/Feature/category/ui/widget/selflove_category/self_love_categories_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category_cubit.dart';

class SelfLoveCategoryWidget extends StatefulWidget {
  const SelfLoveCategoryWidget({super.key});

  @override
  State<SelfLoveCategoryWidget> createState() => _SelfLoveCategoryWidgetState();
}

class _SelfLoveCategoryWidgetState extends State<SelfLoveCategoryWidget> {

  @override
  void initState() {
    context.read<CategoryCubit>().getSelfLoveCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SelfLoveCategoriesBlocBuilder();
  }
}
