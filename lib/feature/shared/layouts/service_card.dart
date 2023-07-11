import 'package:flutter/material.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/cached_network_image_builder.dart';
import 'package:go_fresha/feature/categories/data/model/category.dart';

enum _ServiceCardType { small, large }

class ServiceCard extends StatelessWidget {
  final Category? categoryModel;
  final Function()? onCartButtonClick;
  final Function()? onWishlistButtonClick;
  final Color? decorationColor;
  final _ServiceCardType? type;

  const ServiceCard(
      {super.key,
      required this.categoryModel,
      this.onCartButtonClick,
      this.onWishlistButtonClick,
      this.decorationColor,
      this.type});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, theme) {
      return Padding(
        padding: EdgeInsets.only(
            top: config.appVerticalPaddingSmall(),
            left: config.appEdgePadding(),
            right: config.appEdgePadding(),
            bottom: config.appHeight(5)),
        child: Container(
          width: type == _ServiceCardType.large ? 150 : 150,
          decoration: BoxDecoration(
              border: Border.all(
                  color: decorationColor ?? Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: type == _ServiceCardType.large ? 140 : 98,
                    child:
                        // Container(
                        //   child: Image(
                        //     image: NetworkImage(
                        //         "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                        //     fit: BoxFit.cover,
                        //   ),
                        // )

                        CustomCachedNetworkImage(
                      "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                      fit: BoxFit.cover,
                      IsCompleteUrl: false,
                    ),
                  ),
                  config.verticalSpaceSmall(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: config.appHorizontalPaddingSmall()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryModel!.name,
                            style: theme.textTheme.bodyText2
                                ?.copyWith(fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          config.verticalSpaceVerySmall(),
                          Text("500",style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary,fontWeight: FontWeight.w600),),
                          config.verticalSpaceVerySmall()
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
