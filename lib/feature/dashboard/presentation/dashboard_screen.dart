import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_fresha/SuccessfullyLogin.dart';
import 'package:go_fresha/feature/auth/presentation/screen/login_screen.dart';
import 'package:go_fresha/feature/dashboard/controllers/dashboard_controllers.dart';
import 'package:go_fresha/feature/shared/layouts/auth_widget_wrapper.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashbordController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: Get.find<DashbordController>().tabIndex,
          children: [
            AuthWidgetBuilder(builder: (context, isAuthenticated) {
              return isAuthenticated ? SuccessfullLogin() : const LoginScreen();
            }),
            SuccessfullLogin()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 22,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.password,
                ),
                label: "a"),
            BottomNavigationBarItem(icon: Icon(Icons.password), label: 'd'),
          ],
        ),
      );
    });
  }
}
