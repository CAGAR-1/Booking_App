import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';

import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';

abstract class ServiceRemoteDataSource {
  Future<dynamic> getAllServices(FilterQueryParams filterQueryParams);
}

class ServiceRemoteDataSourceImpl extends ServiceRemoteDataSource {
  final ApiClient apiClient;
  ServiceRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<dynamic> getAllServices(FilterQueryParams filterQueryParams) {
    return apiClient.get(APIPathHelper.homeAPIs(APIPath.accordingToCategory),
        queryParameters: filterQueryParams.toJson());
  }
}
