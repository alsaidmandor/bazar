import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Profile',
        style:
            GoogleFonts.openSans(textStyle: TextStyles.fontHeading20BlackBold),
      )),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}
