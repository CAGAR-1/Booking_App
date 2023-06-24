import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/core/data/data_source/remote/network_exception.dart';
import 'package:go_fresha/feature/auth/data/models/request/login_params.dart';
import 'package:go_fresha/feature/auth/domain/repository/login_repository.dart';
import 'package:go_fresha/feature/auth/presentation/controller/auth_controller.dart';

class LoginController extends GetxController {
  late LoginRepository loginRepository;

  @override
  void onInit() {
    loginRepository = Get.find<LoginRepository>();
    super.onInit();
  }

  late ApiResponse loginResponse;
  void requestLogin(LoginParams loginParams, BuildContext context) async {
    print("Loading");
    loginResponse = await loginRepository.login(loginParams);
    print("Complete");
    if (loginResponse.hasError) {
      Get.snackbar("", NetworkException.getErrorMessage(loginResponse.error));
    } else {
      Get.snackbar("", loginResponse.data);
      Get.find<AuthController>().authorize();
      // Get.back();
    }
  }
}
