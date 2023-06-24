// import 'package:dio/dio.dart';
// import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
// import 'package:go_fresha/core/data/data_source/remote/network_exception.dart';
// import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
// import 'package:go_fresha/feature/auth/data/data_source/remote/login_remote_data_source.dart';
// import 'package:go_fresha/feature/auth/data/models/request/login_params.dart';
// import 'package:go_fresha/feature/auth/domain/repository/login_repository.dart';

// class LoginRepositoryImpl extends LoginRepository {
//   final LoginRemoteDataSource loginRemoteDataSource;
//   final NetworkInfo networkInfo;
//   LoginRepositoryImpl(
//       {required this.loginRemoteDataSource, required this.networkInfo});

//   @override
//   Future<ApiResponse> login(LoginParams loginParams) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final response = await loginRemoteDataSource.login(loginParams);

//         return ApiResponse(data: response[0]['message']);
//       } catch (e) {
//         if (e is DioError && e.type == DioErrorType.response) {
//           print(e.response?.data);
//           return ApiResponse(
//               error: NetworkException.defaultError(
//                   value: e.response?.data[0]['message']));
//         }
//         return ApiResponse(error: NetworkException.getException(e));
//       }
//     } else {
//       return ApiResponse(error: NetworkException.noInternetConnection());
//     }
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:go_fresha/feature/auth/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/auth/domain/repository/login_repository.dart';

import '../../../../core/data/data_source/local/storage_constant.dart';
import '../../../../core/data/data_source/remote/api_result.dart';
import '../../../../core/data/data_source/remote/network_exception.dart';

// import '../../data_source/models/request/login_params.dart';
import '../../../../core/data/data_source/remote/network_info.dart';
import '../data_source/remote/login_remote_data_source.dart';
import '../models/request/login_params.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  // final SocialLoginDataSource socialLoginDataSource;
  final NetworkInfo networkInfo;
  final FlutterSecureStorage secureStorage;

  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
    required this.networkInfo,
    required this.secureStorage,
    // required this.socialLoginDataSource,
  });

  @override
  Future<ApiResponse> login(LoginParams loginParams) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await loginRemoteDataSource.login(loginParams);
        final jsonResponse = jsonDecode(response);

        await secureStorage.write(
            key: StorageConstants.accessToken, value: jsonResponse['token']);
        return ApiResponse(data: jsonResponse['message']);
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          print(e.response?.data);
          var responseData = json.decode(e.response?.data);
          var message = responseData["message"];
          print("yo samma");
          return ApiResponse(
              error: NetworkException.defaultError(value: message));
        }

        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

  // @override
  // Future<ApiResponse> loginWithGoogle() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await socialLoginDataSource.loginWithGoogle();

  //       await secureStorage.write(
  //           key: StorageConstants.accessToken, value: response[0]['token']);

  //       return ApiResponse(data: response[0]['message']);
  //     } catch (e) {
  //       if (e is DioError && e.type == DioErrorType.response) {
  //         print(e.response?.data);
  //         return ApiResponse(
  //             error: NetworkException.defaultError(
  //                 value: e.response?.data[0]['message']));
  //       }
  //       return ApiResponse(error: NetworkException.getException(e));
  //     }
  //   } else {
  //     return ApiResponse(error: NetworkException.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResponse> loginWithFacebook() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await socialLoginDataSource.loginWithFacebook();

  //       await secureStorage.write(
  //           key: StorageConstants.accessToken, value: response[0]['token']);

  //       return ApiResponse(data: response[0]['message']);
  //     } catch (e) {
  //       if (e is DioError && e.type == DioErrorType.response) {
  //         print(e.response?.data);
  //         return ApiResponse(
  //             error: NetworkException.defaultError(
  //                 value: e.response?.data[0]['message']));
  //       }
  //       return ApiResponse(error: NetworkException.getException(e));
  //     }
  //   } else {
  //     return ApiResponse(error: NetworkException.noInternetConnection());
  //   }
  // }
}
