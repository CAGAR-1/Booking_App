import 'dart:convert';
import 'dart:math';

import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/core/data/data_source/remote/network_exception.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/home/data/models/request/home_banner_response.dart';
import 'package:go_fresha/feature/home/data/source/remote/image_slider_remote_data_source.dart';
import 'package:go_fresha/feature/home/domain/banner_repository.dart';

class BannerRepositoryImpl extends BannerRepository {
  final BannerRemoteDataSource bannerRemoteDataSource;
  final NetworkInfo networkInfo;

  BannerRepositoryImpl(
      {required this.bannerRemoteDataSource, required this.networkInfo});
  @override
  Future<ApiResponse> fetchSliderImageList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await bannerRemoteDataSource.getSliderImageList();

        Map<String, dynamic> jsonResponse = json.decode(response);

        var data = jsonResponse['data'];
        print(response);

        final mappedImageSlider =
            data.map((e) => PackageAndOfferModel.fromJson(e)).toList();

        return ApiResponse(data: mappedImageSlider);
      } catch (e) {
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
