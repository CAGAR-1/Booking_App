import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/feature/home/domain/banner_repository.dart';

class ImageSliderController extends GetxController {
  @override
  void onInit() {
    fetchImageSlider();
    super.onInit();
    // TODO: implement onInit
    super.onInit();
  }

  ApiResponse _imageSliderResponse = ApiResponse();
  set imageSliderResponse(ApiResponse apiResponse) {
    _imageSliderResponse = apiResponse;
    update();
  }

  ApiResponse get imageSliderResponse => _imageSliderResponse;
  fetchImageSlider() async {
    imageSliderResponse =
        await Get.find<BannerRepository>().fetchSliderImageList();
  }
}
