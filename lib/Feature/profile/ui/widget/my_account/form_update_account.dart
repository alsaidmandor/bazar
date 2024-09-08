import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/icon_broken.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../auhtentication/data/model/user_model.dart';
import '../../logic/profile_cubit.dart';

class FormUpdateAccount extends StatefulWidget {
  final UserModel model ;
  const FormUpdateAccount({super.key, required this.model});

  @override
  State<FormUpdateAccount> createState() => _FormUpdateAccountState();
}

class _FormUpdateAccountState extends State<FormUpdateAccount> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().nameController.text= widget.model.name!;
    context.read<ProfileCubit>().emailController.text= widget.model.email!;
    context.read<ProfileCubit>().phoneController.text= widget.model.phone!;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ProfileCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            autoFillHint: const [AutofillHints.name],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            onChange: (value) {
            },
            controller: context.read<ProfileCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            autoFillHint: const [AutofillHints.email],
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            onChange: (p0) {

            },
            controller: context.read<ProfileCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone Number',
            prefixIcon: Padding(
              padding: EdgeInsets.all(15.h),
              child: const Icon(
                IconBroken.Call,
                color: AppColor.primary500,
              ),
            ),
            textInputType: TextInputType.phone,

            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number!';
              } else if (value.length < 11) {
                return 'Too short for a phone number!';
              }
              return null;
            },
            controller: context.read<ProfileCubit>().phoneController,
          ),
        ],
      ),
    );
  }
}
