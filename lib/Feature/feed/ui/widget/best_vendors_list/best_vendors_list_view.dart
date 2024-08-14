import 'package:bazaar/Feature/feed/ui/widget/best_vendors_list/best_vendors_item.dart';
import 'package:bazaar/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../data/model/vendor_response_model.dart';

List<VendorResponseModel> vendorList = [
  VendorResponseModel(Assets.iconsGooday, 'GooDay'),
  VendorResponseModel(Assets.iconsCraneco, 'Crane & Co'),
  VendorResponseModel(Assets.iconsHaymarket, 'Haymarket'),
  VendorResponseModel(Assets.iconsJstor, 'Jstor'),
  VendorResponseModel(Assets.iconsKuromi, 'Kuromi'),
  VendorResponseModel(Assets.iconsPeloton, 'Peloton'),
  VendorResponseModel(Assets.iconsPeppapig, 'Peppa Pig'),
  VendorResponseModel(Assets.iconsWarehouse, 'Warehouse'),
  VendorResponseModel(Assets.iconsWattpad, 'Wattpad'),
];

class BestVendorsListView extends StatefulWidget {
  const BestVendorsListView({super.key});

  @override
  State<BestVendorsListView> createState() => _BestVendorsListViewState();
}

class _BestVendorsListViewState extends State<BestVendorsListView> {
  var selectedVendorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          var item = vendorList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedVendorIndex = index;
              });
            },
            child: BestVendorsItem(
              vendorResponseModel: vendorList[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(10);
        },
      ),
    );
  }
}
