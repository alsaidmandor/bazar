import 'package:bazaar/Feature/auhtentication/data/model/user_model.dart';
import 'package:bazaar/Feature/profile/ui/widget/my_account/picked_image_bloc_builder.dart';
import 'package:bazaar/core/helper/spacing.dart';
import 'package:bazaar/core/theme/styles.dart';
import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../logic/profile_cubit.dart';

class PickedImageProfileWidget extends StatelessWidget {
  final UserModel model;

  const PickedImageProfileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if(state is PickedImage) {
                return const CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.greyScale500,
                child:
                     PickedImageBlocBuilder()

              );
              }
              return CircleAvatar                  (
                radius: 50,
                backgroundColor: AppColor.greyScale500,
                child: CachedNetworkImage(
                  imageUrl: model.imageUrl!,
                  imageBuilder: (context, imageProvider) =>
                      ClipOval(
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                  placeholder: (context, url) =>
                      Shimmer.fromColors(
                        baseColor: AppColor.greyScale100,
                        highlightColor: Colors.white,
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              );
            },
          ),
          verticalSpace(15),
          AppTextButton(
            buttonText: 'Change Picture',
            textStyle: TextStyles.fontBody16BlackSemiBold
                .copyWith(color: AppColor.primary500),
            onPressed: () {
              // TODO: Implement change picture functionality
              context.read<ProfileCubit>().pickImage();
            },
            isBorderSide: false,
            buttonWidth: 200,
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
