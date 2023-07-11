import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';

abstract class ServicesRepository {
  Future<ApiResponse> getAllServices(FilterQueryParams filterQueryParams);
}


