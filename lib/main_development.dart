import 'package:bazaar/bazar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
//  flutter run --debug -t lib/main_development.dart --flavor Development
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  // flutter_screenutil
  await ScreenUtil.ensureScreenSize();
  runApp( BazaarApp(appRouter: AppRouter(),));
}

