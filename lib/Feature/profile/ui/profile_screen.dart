import 'package:bazaar/Feature/profile/ui/widget/user_data_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/styles.dart';
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
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger loading logic or fetch profile data here, outside of the build method
      context.read<ProfileCubit>().getUserData();
    });    super.didUpdateWidget(oldWidget);
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
