import 'package:bazaar/Feature/auhtentication/data/model/user_model.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../logic/profile_cubit.dart';

class UserDataAndLogOutWidget extends StatelessWidget {

  final UserModel model ;

  const UserDataAndLogOutWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColor.greyScale500,
            child: CachedNetworkImage(
              imageUrl:model.imageUrl!,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Shimmer.fromColors(
                  baseColor: AppColor.greyScale100,
                  highlightColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                );
              },
              imageBuilder: (context, imageProvider) =>
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  ),
            ),
          ),
          horizontalSpace(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name??"",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyles.fontHeading16BlackBold),
                ),
                Text(
                  model.phone ?? '',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyles.fontBody14BlackRegular).copyWith(color: AppColor.greyScale500),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ProfileCubit>().logOutAuthentication();
              context.pushReplacementNamed(Routes.loginScreen);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
