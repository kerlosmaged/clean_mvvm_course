import 'package:advanced_arabic_mina_course/application%20layers/di.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/forgot_password_screen/forgot_password_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/login_screen/view/login_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/main_screen/main_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/onboarding_screen/view/onboarding_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/register_screen/register_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/color_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/strings_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/styles_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/splash_screen/splash_view.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String splashRoute =
      "/"; // this is mean is the first or root page in your app
  static const String loginRoute = "/login";
  static const String rgisterRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RoutesManager.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());

      case RoutesManager.rgisterRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case RoutesManager.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case RoutesManager.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      case RoutesManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.errorPage),
        ),
        body: Center(
          child: Text(
            AppStrings
                .errorPage, // Todo create an class for strings in your app z
            style: getBoldTextStyle(color: ColorManager.error),
          ),
        ),
      ),
    );
  }
}
