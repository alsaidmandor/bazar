import 'package:bazaar/Feature/profile/ui/widget/user_data_bloc_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/svg_image.dart';
import '../../../res/assets_res.dart';
import 'logic/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger loading logic or fetch profile data here, outside of the build method
      context.read<ProfileCubit>().getUserData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Profile',
        style:
            GoogleFonts.openSans(textStyle: TextStyles.fontHeading20BlackBold),
      )),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(
          20.0,
          16.0,
          20.0,
          28.0,
        ),
        child:
        const UserDataBlocBuilder(),
      ),
    );
  }
}
