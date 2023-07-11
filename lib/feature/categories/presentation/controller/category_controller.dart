import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/feature/categories/repostitory/category_repository.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    fetchCategoryList();
    super.onInit();
  }

  ApiResponse _categoryApiResponse = ApiResponse();

  
  set categoryApiResponse(ApiResponse response) {
    _categoryApiResponse = response;
    update();
  }

  ApiResponse get categoryApiResponse => _categoryApiResponse;

  fetchCategoryList() async {
    categoryApiResponse =
        await Get.find<CategoryRepository>().getAllCategories();
  }
}
