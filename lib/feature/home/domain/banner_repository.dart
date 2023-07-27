import 'package:go_fresha/core/data/data_source/remote/api_result.dart';

abstract class BannerRepository {
  Future<ApiResponse> fetchSliderImageList();
  Future<ApiResponse> fetchimage();
  
}
