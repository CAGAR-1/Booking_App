import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_fresha/core/presentation/resources/ui_assets.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/clipper.dart';
import 'package:go_fresha/core/presentation/widgets/home_screen_clipper.dart';
import 'package:go_fresha/feature/home/presentation/widgets/category.dart';

import '../../../shared/layouts/appbar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: BaseWidget(builder: (context, config, theme) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ClipPath(
                  clipper: Home_Clipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        image: const DecorationImage(
                            image: AssetImage(UiAssets.clipperImage),
                            fit: BoxFit.cover)),
                    // child: const Image(
                    //   image: AssetImage(UiAssets.clipperImage),
                    //   fit: BoxFit.cover,
                    // )

                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        config.verticalSpaceMedium(),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: config.appEdgePadding()),
                            child: Column(
                              children: [
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      // size: 30,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      // size: ,
                                    )
                                  ],
                                ),
                                config.verticalSpaceCustom(0.2),
                                Text("Find and book best service",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Colors.white, fontSize: 20)),
                                config.verticalSpaceSmall(),
                                SearchBarContainer(
                                  onPressed: () {},
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: config.appEdgePadding(),
                      vertical: config.appHorizontalPaddingSmall()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      config.verticalSpaceLarge(),
                      Categories(),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
