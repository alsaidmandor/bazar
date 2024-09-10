import 'package:bazaar/Feature/auhtentication/data/model/user_model.dart';
import 'package:bazaar/Feature/profile/ui/logic/profile_cubit.dart';
import 'package:bazaar/Feature/profile/ui/widget/my_account/picked_image_profile_widget.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'form_update_account.dart';

class MyAccountBodyWidget extends StatelessWidget {

  final UserModel model ;
  const MyAccountBodyWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        20.0,
        16.0,
        20.0,
        28.0,
      ),
      child:ListView(
        children: [
          PickedImageProfileWidget(model: model),
          verticalSpace(20),
          FormUpdateAccount(model: model,),
          verticalSpace(70),
          AppTextButton(
            buttonText: 'Save Changes',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              context.read<ProfileCubit>().updateProfile(model);
              context.read<ProfileCubit>().getUserData();
              context.pop();

            },

          )

        ],
      ),
    );
  }
}
