import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/cached_network_image_builder.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';
import 'package:go_fresha/feature/services/presentation/controller/service_listing_controller.dart';

class ListingScrensss extends StatelessWidget {
  FilterQueryParams filterQueryParams;
  ListingScrensss({super.key, required this.filterQueryParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ServiceListingController>(
          init: ServiceListingController(filterQueryParams),
          builder: (controller) {
            return BaseWidget(builder: (context, config, theme) {
              return Column(
                children: [
                  GetBuilder<ServiceListingController>(builder: (controller) {
                    final reasult = Get.find<ServiceListingController>()
                        .serviceListResponse;

                    if (reasult.hasData) {
                      final listinglist = controller.serviceList;
                      return Row(
                        children: [
                          SizedBox(
                            height: 76,
                            width: 56,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: reasult.data.length,
                              itemBuilder: (context, index) {
                                return CustomCachedNetworkImage(
                                    reasult.data[index].image);
                              },
                            ),
                          ),
                          Text(controller.serviceList.length.toString()),
                          ElevatedButton(
                              onPressed: () {
                                print(filterQueryParams.category_Id);
                                print(controller.serviceList);
                              },
                              child: Text("Clicke me")),
                        ],
                      );

                      // Center(child: Text(reasult.data[0].image));
                    } else
                      return Center(child: Text("No"));
                  })
                ],
              );
            });
          },
        ));
  }
}
