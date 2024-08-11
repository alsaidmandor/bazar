import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: GoogleFonts.openSans(
              textStyle: TextStyles.fontHeading20BlackBold),
        ),
      ),
      body: Center(
        child: Text('Your shopping cart is empty.'),
      ),
    );
  }
}
