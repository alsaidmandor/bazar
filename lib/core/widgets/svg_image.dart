import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit; // Add BoxFit for image fitting

  const SvgImage({
    Key? key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.fit, // Add fit parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover, // Use provided fit or default to BoxFit.contain
    );
  }
}