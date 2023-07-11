import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';

abstract class BannerRemoteDataSource {
  Future<dynamic> getSliderImageList();
}

class BannerRemoteDataSourceImpl extends BannerRemoteDataSource {
  final ApiClient apiClient;

  BannerRemoteDataSourceImpl({required this.apiClient});
  @override
  Future getSliderImageList() {
    return apiClient.get(APIPathHelper.homeAPIs(APIPath.imageSlider));
  }
}
