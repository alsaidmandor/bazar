import 'package:bazaar/Feature/feed/logic/feed_cubit.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/icon_broken.dart';
import '../../../../../core/widgets/app_text_form_field.dart';


class SearchForm extends StatelessWidget {
  const SearchForm({super.key});


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<FeedCubit>().formKey,
      child: AppTextFormField(
        hintText: 'Search',
        radius: 10,
        onEditingComplete: () {

        },
        onChange: (search) {
          if(search == null){
            context.read<FeedCubit>().searchController.clear();
          }
          context.read<FeedCubit>().getSearchBooks(search:search!);

        },
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !AppRegex.isEmailValid(value)) {
            return 'Please enter a valid email';
          }
        },
        prefixIcon: const Icon(IconBroken.Search, color: AppColor.greyScale500,),
        controller: context.read<FeedCubit>().searchController,
      ),
    );
  }


}
