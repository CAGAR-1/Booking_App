import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';
import 'package:go_fresha/feature/services/presentation/controller/service_listing_controller.dart';
import 'package:go_fresha/feature/services/presentation/service_listing/service_list_view.dart';

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
                child: SingleChildScrollView(
                  child:
                      // Text(controller.serviceList.length.toString()

                      // )

                      ServiceListViewBuilder(
                          serviceList: controller.serviceList),
                ),
              );
            });
          }),
      // body: GetBuilder(builder: ),
    );
  }
}
