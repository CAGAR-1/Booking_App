import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/network_exception.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/shimmer_widget.dart';
import 'package:go_fresha/core/utils/size_config.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';
import 'package:go_fresha/feature/services/presentation/controller/service_listing_controller.dart';
import 'package:go_fresha/feature/services/presentation/service_listing/service_list_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServiceListingScreen extends StatefulWidget {
  FilterQueryParams filterQueryParams;

  ServiceListingScreen({super.key, required this.filterQueryParams});

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  @override
  void initState() {
    // Get.put()
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();

    void refreshComplete() {
      refreshController.refreshCompleted();
    }

    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ServiceListingController>(
            init: ServiceListingController(widget.filterQueryParams),
            builder: (controller) {
              return BaseWidget(builder: (context, config, theme) {
                return Padding(
                    padding: EdgeInsets.only(
                        top: config.appVerticalPaddingSmall(),
                        left: config.appEdgePadding(),
                        right: config.appEdgePadding(),
                        bottom: config.appHeight(6)),
                    child: SmartRefresher(
                      controller: refreshController,
                      // onRefresh: ,
                      onRefresh: refreshComplete,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GetBuilder<ServiceListingController>(
                              init: ServiceListingController(
                                  widget.filterQueryParams),
                              builder: (controller) {
                                final result =
                                    Get.find<ServiceListingController>()
                                        .serviceListResponse;

                                if (result.hasData) {
                                  final serviceList = controller.serviceList;

                                  return serviceList.isEmpty
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.9,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Sorry we cant find service matching the selection")
                                            ],
                                          ),
                                        )
                                      : SingleChildScrollView(
                                          child: ServiceListViewBuilder(
                                              serviceList:
                                                  controller.serviceList),
                                        );
                                } else if (result.hasError) {
                                  return Center(
                                    child: Text(
                                        NetworkException.getErrorMessage(
                                            result.error)),
                                  );
                                } else {
                                  return const SingleChildScrollView(
                                      child: LoadingServiceListView());
                                }
                              })
                        ],
                      ),
                    ));
              });
            })

        // body: GetBuilder(builder: ),
        );
  }
}

class LoadingServiceListView extends StatelessWidget {
  const LoadingServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(4, (index) {
        return ShimmerWidget.rounded(height: 170, width: 130, borderradius: 10);
      }),
    );
  }
}
