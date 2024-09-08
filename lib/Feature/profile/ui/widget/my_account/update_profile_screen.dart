import 'package:bazaar/Feature/profile/ui/logic/profile_cubit.dart';
import 'package:bazaar/Feature/profile/ui/widget/my_account/my_account_bloc_builder.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/icon_broken.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../auhtentication/data/model/user_model.dart';
import 'my_account_body_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  final UserModel  model ;
  const UpdateProfileScreen({super.key, required this.model});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


  @override
  void initState() {
    super.initState();
   /* WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger loading logic or fetch profile data here, outside of the build method
      context.read<ProfileCubit>().getUserData();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconBroken.Arrow___Left,
        onLeadingIconPressed: () {
          context.pop();
        },
        leadingPadding: EdgeInsets.only(left: 20.w),
        titleText: 'My Account',
        titleStyle:
        GoogleFonts.openSans(textStyle: TextStyles.fontHeading20BlackBold),
      ),
      body: MyAccountBodyWidget(model: widget.model,),
    );
  }
}
