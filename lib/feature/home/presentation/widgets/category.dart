import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/presentation/routes/app_pages.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/cached_network_image_builder.dart';
import 'package:go_fresha/feature/services/data/model/request/filter_query_params.dart';

import '../../../../trys.dart';
import '../../../categories/presentation/controller/category_controller.dart';

// import 'package:go_fresha/feature/categories/presentation/controller/category_controller.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<CategoryController>(builder: (contorller) {
          final reasult = contorller.categoryApiResponse;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: BaseWidget(builder: (context, config, theme) {
              if (reasult.hasData) {
                final responselist = reasult.data;

                return Row(
                  children: List.generate(
                      responselist.length,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: config.appEdgePadding(),
                              vertical: config.appHorizontalPaddingSmall()),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(reasult.data[index].id);
                                },
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.servicesListingScreen,
                                        arguments: FilterQueryParams(
                                            category_Id: int.parse(
                                                reasult.data[index].id)));
                                  },
                                  child: SizedBox(
                                      height: 85,
                                      child: CustomCachedNetworkImage(
                                          responselist[index].image)),
                                ),
                              )
                            ],
                          )

                          // ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: reasult.data.length,
                          //   itemBuilder: (context, index) {
                          //     return

                          //     // Text(reasult.data[index].description);
                          //   },
                          // ),
                          )),
                );

                //   Center(child: Text(responselist.length.toString()));
              } else
                return Center(child: Text("d"));
            }),
          );

          // => Center(
          //   child: Row(
          //     children: [
          //       if(reasult.hasData)
          //       final List<Category> categoryList=reasult.data;
          //     ],
          //   ),

          //     )
        }));
  }
}
