import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:go_fresha/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:go_fresha/feature/auth/domain/repository/auth_repository.dart';
import 'package:go_fresha/feature/auth/presentation/controller/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // const baseUrl = APIPathHelper.baseUrl;

    Get
      ..put<AuthLocalDataSource>(
          AuthLocalDataSourceImpl(Get.find<FlutterSecureStorage>()),
          permanent: true)
      ..put<AuthRepository>(
          AuthRepostoryImpl(
            networkInfo: Get.find<NetworkInfo>(),
            authLocalDataSource: Get.find<AuthLocalDataSource>(),
          ),
          permanent: true)
      ..put(AuthController(), permanent: true);

    // ..put(ApiClient(baseUrl: baseUrl, dio: Get.find<Dio>()));
  }
}
