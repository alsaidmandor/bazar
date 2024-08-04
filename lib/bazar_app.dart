import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Feature/onboarding/onboarding_screen.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors.dart';

class BazaarApp extends StatelessWidget {
  final AppRouter appRouter;
  const BazaarApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Bazaar App',

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primaryColor: AppColor.primary500,
          scaffoldBackgroundColor: AppColor.white,
          useMaterial3: true,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        home: OnBoardScreen(),
      ),
    );
  }
}
