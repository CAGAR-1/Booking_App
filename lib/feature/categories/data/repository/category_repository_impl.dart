import 'dart:convert';

import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/core/data/data_source/remote/network_info.dart';
import 'package:go_fresha/feature/categories/data/source/remote/category_remote_data_source.dart';
import 'package:go_fresha/feature/categories/repostitory/category_repository.dart';

import '../../../../core/data/data_source/remote/network_exception.dart';
import '../model/category.dart';

class Categoryrepositoryimpl extends CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final NetworkInfo networkInfo;

  Categoryrepositoryimpl(
      {required this.categoryRemoteDataSource, required this.networkInfo});

  @override
  Future<ApiResponse> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await categoryRemoteDataSource.getAllCategoreis();

        Map<String, dynamic> jsonResponse = json.decode(response);

        var data = jsonResponse['data'];
        print(response);

        final mappedImageSlider =
            data.map((e) => Category.fromJson(e)).toList();

        return ApiResponse(data: mappedImageSlider);
      } catch (e) {
        return ApiResponse(error: NetworkException.getException(e));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
