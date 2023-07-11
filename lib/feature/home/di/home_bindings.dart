import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/home/data/repository/banner_repository_impl.dart';
import 'package:go_fresha/feature/home/data/data_source/remote/image_slider_remote_data_source.dart';
import 'package:go_fresha/feature/home/domain/banner_repository.dart';
import 'package:go_fresha/feature/home/presentation/controller/image_slider_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<BannerRemoteDataSource>(
          BannerRemoteDataSourceImpl(apiClient: Get.find<ApiClient>()))
      ..put<BannerRepository>(BannerRepositoryImpl(
          bannerRemoteDataSource: Get.find<BannerRemoteDataSource>(),
          networkInfo: Get.find<NetworkInfo>()))
      ..put(ImageSliderController());
  }
}
