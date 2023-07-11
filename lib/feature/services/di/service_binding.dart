import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/services/data/data_source/remote/service_remote_data_source.dart';
import 'package:go_fresha/feature/services/data/data_source/repository/services_repository_impl.dart';
import 'package:go_fresha/feature/services/domain/repository/services_repository.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<ServiceRemoteDataSource>(
          ServiceRemoteDataSourceImpl(apiClient: Get.find<ApiClient>()))
      ..put<ServicesRepository>(
          ServicesRepositoryImpl(
              networkInfo: Get.find<NetworkInfo>(),
              serviceRemoteDataSource: Get.find<ServiceRemoteDataSource>()),
          permanent: true);
    print("hi");
  }
}
