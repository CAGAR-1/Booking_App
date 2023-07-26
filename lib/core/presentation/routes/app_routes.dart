part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const dashboard = _Paths.dashboard;
  static const carousal = _Paths.carousal;
  static const categories = _Paths.categories;
  static const servicesListingScreen = _Paths.servicesListingScreen;
  static const HomeScreen = _Paths.homescreen;
}

abstract class _Paths {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const carousal = '/carousal';
  static const categories = '/categories';
  static const servicesListingScreen = '/servicesListingScreen';
  static const homescreen = '/HomeScreen';
}
