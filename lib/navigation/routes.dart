import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prueba_auth/screens/email_create_screen.dart';
import 'package:prueba_auth/screens/email_signin_screen.dart';
import 'package:prueba_auth/screens/intro_screen/intro_screen.dart';
import 'package:prueba_auth/screens/profile_screen/profile_screen.dart';
import 'package:prueba_auth/screens/splash_screen/splash_screen.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/signin_screen/sign_in.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const signIn = '/signin';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const home = '/home';
  static const profile = '/profile/:id/:image/:nameLocutora/:namePrograma';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(settings, page: const SplashScreen());
      case intro:
        return _buildRoute(settings, page: const IntroScreen());
      case home:
        return _buildRoute(settings, page: const HomeScreen());
      case createAccount:
        return _buildRoute(settings, page: EmailCreate());
      case signInEmail:
        return _buildRoute(settings, page: EmailSignIn());
      case signIn:
        return _buildRoute(settings, page: const SignInScreen());
      case profile:
        return _buildRoute(settings, page: const ProfileScreen());
      default:
        throw Exception('Route does not exists');
    }
  }

  static GetPageRoute _buildRoute(RouteSettings settings,
          {required Widget page}) =>
      GetPageRoute(settings: settings, page: () => page);
}
