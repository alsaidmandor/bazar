import 'package:bazaar/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../generated/assets.dart';
import '../../logic/sign_up_cubit.dart';

class SignupPhoneForm extends StatefulWidget {
  const SignupPhoneForm({super.key});

  @override
  State<SignupPhoneForm> createState() => _SignupPhoneFormState();
}

class _SignupPhoneFormState extends State<SignupPhoneForm> {
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formKeyPhone,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary500),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  '${generateCountryFlag()} +20',
                  style: TextStyles.fontBody16BlackRegular,
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              flex: 3,
              child: AppTextFormField(
                hintText: 'Phone Number',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(15.h),
                  child: const SvgImage(
                    assetPath: Assets.iconsIconCall,
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
                onSaved: (value) {
                  phoneNumber = value!;
                },
                controller: context.read<SignupCubit>().phoneController,
              ),
            ),
          ],
        ));
  }

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
