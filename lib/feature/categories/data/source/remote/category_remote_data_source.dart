import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';

abstract class CategoryRemoteDataSource {
  Future<dynamic> getAllCategoreis();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<dynamic> getAllCategoreis() {
    return apiClient.get(APIPathHelper.homeAPIs(APIPath.category));

    //
  }
}
