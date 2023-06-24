import 'package:get/get.dart';
import 'package:go_fresha/feature/dashboard/controllers/dashboard_controllers.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashbordController(), permanent: true);
  }
}
