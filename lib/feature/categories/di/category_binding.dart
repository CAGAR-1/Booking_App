import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/categories/data/repository/category_repository_impl.dart';
import 'package:go_fresha/feature/categories/data/source/remote/category_remote_data_source.dart';
import 'package:go_fresha/feature/categories/presentation/controller/category_controller.dart';
import 'package:go_fresha/feature/categories/repostitory/category_repository.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<CategoryRemoteDataSource>(
          CategoryRemoteDataSourceImpl(apiClient: Get.find<ApiClient>()))
      ..put<CategoryRepository>(Categoryrepositoryimpl(
          categoryRemoteDataSource: Get.find<CategoryRemoteDataSource>(),
          networkInfo: Get.find<NetworkInfo>()))
      ..put(CategoryController());
  }
}
