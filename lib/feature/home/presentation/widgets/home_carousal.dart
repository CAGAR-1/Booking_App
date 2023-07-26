import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/data/data_source/remote/api_client.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';
import 'package:go_fresha/core/data/data_source/remote/api_result.dart';
import 'package:go_fresha/core/presentation/resources/ui_assets.dart';
import 'package:go_fresha/core/presentation/widgets/circular_cached_network_image_builder.dart';
import 'package:go_fresha/core/presentation/widgets/image_slider.dart/image_slider.dart';
import 'package:go_fresha/core/utils/size_config.dart';
import 'package:go_fresha/feature/home/presentation/controller/image_slider_controller.dart';

class HomeCarousal extends StatelessWidget {
  const HomeCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    final _config = SizeConfig(context);

    return Scaffold(
      body: GetBuilder<ImageSliderController>(builder: (controller) {
        final result = controller.imageSliderResponse;
        if (result.hasData) {
          final sliderResponseList = result.data;
          if (sliderResponseList.isNotEmpty) {
            return SizedBox(
              height: _config.appHeight(16),
              child: InkWell(
                child: ImageSlider(
                    images: sliderResponseList
                        .map((slider) => InkWell(
                              onTap: () {
                                print(slider.id);
                            
                              },
                              child: CircularCachedNetworkImageBuilder(
                                imageurl: slider.image,
                                borderRadius: 8,
                                isBorderEnabled: false,
                              ),
                            ))
                        .toList()),
              ),
            );
          } else {
            return Container(
              height: 100,
              width: 200,
              color: Colors.black,
            );
          }
        } else if (result.hasError) {
          return Text("Error");
        } else {
          return Text("lOADING");
        }
      }),
    );
  }
}
