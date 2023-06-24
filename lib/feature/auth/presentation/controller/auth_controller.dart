import 'package:get/get.dart';
import 'package:go_fresha/feature/auth/domain/repository/auth_repository.dart';

class AuthController extends GetxController {
  final authRepository = Get.find<AuthRepository>();
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() async {
    isLoggedIn.value = await isAuthenticated();

    super.onInit();
  }

  isAuthenticated() async {
    return await authRepository.isAuthenticated();
  }

  void logOut() async {
    await authRepository.logout();
    isLoggedIn.value = false;
    // Route to login page
  }

  authorize() async {
    isLoggedIn.value = true;
  }
}
