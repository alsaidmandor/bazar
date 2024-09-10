import 'dart:io';

import 'package:bazaar/Feature/profile/ui/widget/my_account/picked_image_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/colors.dart';
import '../../logic/profile_cubit.dart';

class PickedImageBlocBuilder extends StatelessWidget {
  const PickedImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
      current is PickedImage ,
          builder: (context, state) {
            return state.maybeWhen(
             pickedImage: (imageFile) {
               return setupSuccess(imageFile);
             }, orElse: () =>setupError(),

            );
          },

    );
  }
  setupLoading(context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primary500,
      ),
    );
  }

  Widget setupSuccess(  File? imageFile) {
    // return PickedImageProfileWidget( imageUrl: url,);
    return  ClipOval(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.file(
        imageFile!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
    ) ;
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
