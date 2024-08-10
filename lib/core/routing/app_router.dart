import 'package:bazaar/Feature/auhtentication/login/ui/login_screen.dart';
import 'package:bazaar/Feature/auhtentication/signup/logic/sign_up_cubit.dart';
import 'package:bazaar/Feature/auhtentication/signup/ui/otp_screen.dart';
import 'package:bazaar/Feature/auhtentication/signup/ui/sign_up_screen.dart';
import 'package:bazaar/Feature/onboarding/onboarding_screen.dart';
import 'package:bazaar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Feature/auhtentication/data/repository/authentication_repository.dart';
import '../../Feature/auhtentication/login/logic/cubit/login_cubit.dart';
import '../../Feature/auhtentication/signup/ui/sign_up_phone_screen.dart';
import '../../Feature/auhtentication/signup/ui/widgets/sign_up_success_verification.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(AuthenticationRepository()),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(
              AuthenticationRepository(),
            ),
            child: const SignupScreen(),
          ),
        );
      case Routes.signUpPhoneScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(
              AuthenticationRepository(),
            ),
            child: const SignUpPhoneScreen(),
          ),
        );
      case Routes.otpScreen:
        final args = settings.arguments as OtpScreen;
        final verificationId = args.verificationId;
        final phoneNumber = args.phoneNumber;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(
              AuthenticationRepository(),
            ),
            child: OtpScreen(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ),
          ),
        );

      case Routes.signUpSuccessVerification:
        return MaterialPageRoute(
          builder: (_) => const SignUpSuccessVerification(),
        );
      default:
        return null;
    }
  }
}
