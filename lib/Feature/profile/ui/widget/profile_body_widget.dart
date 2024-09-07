import 'package:bazaar/Feature/profile/ui/widget/user_data_and_log_out_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/styles.dart';
import '../../../auhtentication/data/model/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/icon_broken.dart';
class ProfileBodyWidget extends StatelessWidget {

  final UserModel model ;

   const ProfileBodyWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          color: AppColor.greyScale500,
        ),

        UserDataAndLogOutWidget(model: model,),
        const Divider(
          height: 1,
          color: AppColor.greyScale500,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Profile, color: AppColor.primary500,),
          title: Text(
            'My Account',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Location, color: AppColor.primary500,),
          title: Text(
            'Address',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Discount, color: AppColor.primary500,),
          title: Text(
            'Offers & Rewards',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Heart, color: AppColor.primary500,),
          title: Text(
            'Your Favorites',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Document, color: AppColor.primary500,),
          title: Text(
            'Order History',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(IconBroken.Info_Circle, color: AppColor.primary500,),
          title: Text(
            'Help Center',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontBody16BlackMedium),
          ),
          trailing: const Icon(
            IconBroken.Arrow___Right_2,
            color: AppColor.primary500,
          ),
        ),
      ],
    );
  }
}
