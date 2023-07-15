import 'dart:convert';

import 'package:go_fresha/core/data/data_source/remote/network_exception.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/services/data/data_source/remote/service_remote_data_source.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';
import 'package:go_fresha/feature/services/data/model/response/service_model.dart';

import '../../../../../core/data/data_source/remote/api_result.dart';
import '../../../domain/repository/services_repository.dart';

class ServicesRepositoryImpl extends ServicesRepository {
  final ServiceRemoteDataSource serviceRemoteDataSource;
  final NetworkInfo networkInfo;
  ServicesRepositoryImpl(
      {required this.networkInfo, required this.serviceRemoteDataSource});

  @override
  Future<ApiResponse> getAllServices(
      FilterQueryParams filterQueryParams) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await serviceRemoteDataSource.getAllServices(filterQueryParams);

        Map<String, dynamic> jsonResponse = json.decode(result);
        var data = jsonResponse['data'];
        print(result);

        final serviceList =
            data.map<ServiceModel>((e) => ServiceModel.fromJson(e));

        // data.map((e) => ServiceModel.fromJson(e)).toList();

        return ApiResponse(data: serviceList);
      } catch (e) {
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
