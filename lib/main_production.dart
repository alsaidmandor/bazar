import 'package:bazaar/bazar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
//  flutter run --release -t lib/main_production.dart --flavor Production
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  // flutter_screenutil
  await ScreenUtil.ensureScreenSize();
  // to marge from dev to master fake commit
  runApp( BazaarApp(appRouter: AppRouter(),));
}

