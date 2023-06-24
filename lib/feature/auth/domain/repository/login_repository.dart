import 'package:go_fresha/core/data/data_source/remote/api_result.dart';

import '../../data/models/request/login_params.dart';

abstract class LoginRepository {
  Future<ApiResponse> login(LoginParams loginParams);
}
