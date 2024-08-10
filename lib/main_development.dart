import 'package:bazaar/bazar_app.dart';
import 'package:bazaar/core/helper/extensions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'core/helper/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'core/utils/SharedPrefKeys.dart';
import 'core/utils/constants.dart';
import 'firebase_options.dart';

//  flutter run --debug -t lib/main_development.dart --flavor Development
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  Bloc.observer = MyBlocObserver();

  // flutter_screenutil
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkIfLoggedInUser();

  runApp(BazaarApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userId = await SharedPrefHelper.getString(SharedPrefKeys.userUid);
  if (!userId!.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
