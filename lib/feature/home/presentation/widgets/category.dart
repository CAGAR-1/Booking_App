import 'package:colour/colour.dart';
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
    List colorss = [
      Colour('#fd6c57'),
      Colour('#007aff'),
      Colour('#fe457c'),
      Colour('#615dd9'),
      Colour('#fe9654')
    ];
    int colorIndex = 0;
    return GetBuilder<CategoryController>(builder: (contorller) {
      final reasult = contorller.categoryApiResponse;
      return BaseWidget(
        builder: (context, config, theme) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Categories",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              config.verticalSpaceSmall(),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: BaseWidget(
                  builder: (context, config, theme) {
                    if (reasult.hasData) {
                      final responselist = reasult.data;

                      return Row(
                        children: List.generate(responselist.length, (index) {
                          Color color = colorss[colorIndex % colorss.length];
                          colorIndex++;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    config.appHorizontalPaddingMedium()),
                            child: Column(
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
                                                reasult.data[index].id),
                                          ));
                                    },
                                    child: SizedBox(
                                      height: 85,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomCachedNetworkImage(
                                              responselist[index].image),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                config.verticalSpaceSmall(),
                                Text(
                                  responselist[index].name,
                                  style: theme.textTheme.bodyText2
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    } else {
                      return Center(child: Text("d"));
                    }
                  },
                ),
              ),
            ],
          );
        },
      );

      // => Center(
      //   child: Row(
      //     children: [
      //       if(reasult.hasData)
      //       final List<Category> categoryList=reasult.data;
      //     ],
      //   ),

      //     )
    });
  }
}
