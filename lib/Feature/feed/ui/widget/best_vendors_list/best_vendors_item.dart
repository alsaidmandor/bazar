import 'package:bazaar/Feature/feed/data/model/vendor_response_model.dart';
import 'package:bazaar/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class BestVendorsItem extends StatelessWidget {
  final VendorResponseModel vendorResponseModel;
  const BestVendorsItem({Key? key, required this.vendorResponseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.fromLTRB(
        5.0,
        5.0,
        5.0,
        5.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.greyScale50),
      child: SvgImage(
        assetPath: vendorResponseModel.imagePath,
        // height: 30,
        // width: 30,
        fit: BoxFit.contain,
      ),
    );
  }
}
