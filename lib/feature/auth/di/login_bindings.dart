import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/auth/data/data_source/remote/login_remote_data_source.dart';
import 'package:go_fresha/feature/auth/data/repository/login_repository_impl.dart';
import 'package:go_fresha/feature/auth/domain/repository/login_repository.dart';
import 'package:go_fresha/feature/auth/presentation/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<LoginRemoteDataSource>(
          LoginRemoteDataSourceImpl(Get.find<ApiClient>()))
      ..put<LoginRepository>(LoginRepositoryImpl(
          loginRemoteDataSource: Get.find<LoginRemoteDataSource>(),
          networkInfo: Get.find<NetworkInfo>(),
          secureStorage: Get.find<FlutterSecureStorage>()))
      ..put(LoginController());
  }
}
