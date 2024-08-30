import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category_cubit.dart';
import '../category_item_widget.dart';
import '../category_Grid_list_view_widget.dart';
import 'all_categories_bloc_builder.dart';

class AllCategoryWidget extends StatefulWidget {
  const AllCategoryWidget({super.key});

  @override
  State<AllCategoryWidget> createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {

  @override
  void initState() {
    context.read<CategoryCubit>().getGetAllCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   const AllCategoriesBlocBuilder();
  }
}
