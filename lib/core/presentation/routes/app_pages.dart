import 'package:get/get.dart';
import 'package:go_fresha/core/di/core_bindings.dart';
// import 'package:go_fresha/feature/auth/di/auth_bindings.dart';
import 'package:go_fresha/feature/auth/di/login_bindings.dart';
import 'package:go_fresha/feature/auth/presentation/controller/login_controller.dart';
import 'package:go_fresha/feature/auth/presentation/screen/login_screen.dart';
import 'package:go_fresha/feature/categories/di/category_binding.dart';
import 'package:go_fresha/feature/dashboard/di/dashboard_bindings.dart';
import 'package:go_fresha/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:go_fresha/feature/home/di/home_bindings.dart';
import 'package:go_fresha/feature/home/presentation/widgets/category.dart';
import 'package:go_fresha/feature/home/presentation/widgets/home_carousal.dart';
import 'package:go_fresha/feature/services/di/service_binding.dart';

import '../../../feature/auth/di/auth_bindings.dart';
import '../../../trys.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.categories;
  static final routes = [
    GetPage(name: _Paths.login, page: LoginScreen.new, bindings: [
      CoreBindings(),
      AuthBindings(),
      LoginBindings(),
    ]),
    GetPage(name: _Paths.dashboard, page: DashboardScreen.new, bindings: [
      DashBoardBindings(),
      CoreBindings(),
      AuthBindings(),
      LoginBindings()
    ]),
    GetPage(
        name: _Paths.categories,
        page: Categories.new,
        bindings: [CoreBindings(), CategoryBindings(), ServiceBinding()]),
    GetPage(
        name: _Paths.carousal,
        page: HomeCarousal.new,
        bindings: [CoreBindings(), AuthBindings(), HomeBindings()]),
    GetPage(
        name: _Paths.servicesListingScreen,
        page: ()=>ListingScrensss(filterQueryParams: Get.arguments,),
        bindings: [CoreBindings(), AuthBindings(), HomeBindings()])
  ];
}
