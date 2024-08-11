import 'package:bazaar/Feature/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Feature/home/ui/home_screen.dart';
import 'Feature/onboarding/onboarding_screen.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors.dart';
import 'core/utils/constants.dart';

class BazaarApp extends StatelessWidget {
  final AppRouter appRouter;

  const BazaarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Bazaar App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColor.primary500,
            appBarTheme: AppBarTheme(
                backgroundColor: AppColor.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: AppColor.greyScale500),
                centerTitle: true),
            scaffoldBackgroundColor: AppColor.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColor.greyScale50,
              elevation: 0,
              selectedItemColor: AppColor.primary500,
              unselectedItemColor: AppColor.greyScale500,
            ),
            useMaterial3: false,
          ),
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
          home: isLoggedInUser ? const HomeScreen() : const OnBoardScreen(),
        ),
      ),
    );
  }
}
