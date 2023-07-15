import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';
import 'package:go_fresha/feature/services/data/model/response/service_model.dart';
import 'package:go_fresha/feature/services/domain/repository/services_repository.dart';

class ServiceListingController extends GetxController {
  final FilterQueryParams filterQueryParams;
  ServiceListingController(this.filterQueryParams);
  @override
  void onInit() {
    fetchServiceList(filterQueryParams);

    super.onInit();
  }

  late ApiResponse _serviceListResponse = ApiResponse();

  set serviceListResponse(ApiResponse response) {
    _serviceListResponse = response;
    update();
  }

  ApiResponse get serviceListResponse => _serviceListResponse;

  List<ServiceModel> serviceList = [];

  fetchServiceList(FilterQueryParams filterQueryParams,
      {bool filterData = true}) async {
    serviceListResponse =
        await Get.find<ServicesRepository>().getAllServices(filterQueryParams);

    // if (serviceListResponse.hasData) {
    //   if (filterData == true) serviceList.clear();

    // serviceList.add(serviceListResponse.data);
    serviceList.addAll(serviceListResponse.data);
  }
  // if (serviceListResponse.hasData) {
  //   if (filterData == true) serviceList.clear();
  //   for (dynamic data in serviceListResponse.data) {
  //     if (data is Map<String, dynamic>) {
  //       ServiceModel serviceModel = ServiceModel.fromJson(data);
  //       serviceList.addAll(serviceListResponse.data);
  //     }
  //   }
  // }
}
// }


//


