import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/styles.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: GoogleFonts.openSans(
                textStyle: TextStyles.fontHeading20BlackBold),
          ),
        ),
        body: Center(
          child: Text('Feed Screen'),
        ));
  }
}
