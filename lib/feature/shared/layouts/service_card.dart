import 'package:flutter/material.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/cached_network_image_builder.dart';
import 'package:go_fresha/feature/categories/data/model/category.dart';

import '../../services/data/model/response/service_model.dart';

enum _ServiceCardType { small, large }

class ServiceCard {
  static _ServiceCard small(
          {required ServiceModel serviceModel,
          Function()? onCartButtonClick,
          Function()? onWishListButtonClick}) =>
      _ServiceCard(
        serviceModel: serviceModel,
        type: _ServiceCardType.small,
        onCartButtonClick: onCartButtonClick,
        onWishlistButtonClick: onWishListButtonClick,
      );
  static _ServiceCard large(
      {required ServiceModel serviceModel,
      Function()? oncartButtonClick,
      Function()? onWishlistButtonClick}) {
    return _ServiceCard(
      serviceModel: serviceModel,
      type: _ServiceCardType.large,
      onCartButtonClick: oncartButtonClick,
      onWishlistButtonClick: onWishlistButtonClick,
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceModel serviceModel;
  final Function()? onCartButtonClick;
  final Function()? onWishlistButtonClick;
  final Color? decorationColor;
  final _ServiceCardType? type;

  const _ServiceCard(
      {super.key,
      required this.serviceModel,
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
            bottom: config.appHeight(1)),
        child: Container(
          width: type == _ServiceCardType.large ? 150 : 150,
          decoration: BoxDecoration(
              border: Border.all(
                  color: decorationColor ?? Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white.withOpacity(0.5)),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: type == _ServiceCardType.large ? 140 : 98,
                    child: CustomCachedNetworkImage(
                      serviceModel.image,
                      fit: BoxFit.cover,
                      IsCompleteUrl: false,
                    ),
                  ),
                  Text("Price 500")
                ],
              ),
              // config.verticalSpaceSmall(),
              SizedBox(
                width: config.appHorizontalPaddingMedium(),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceModel.name,
                    // categoryModel!.name,
                    style: theme.textTheme.bodyText2
                        ?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // config.verticalSpaceVerySmall(),
                  config.verticalSpaceSmall(),
                  Text(
                    serviceModel.description,
                    style: theme.textTheme.bodyText1?.copyWith(
                      color: Colors.grey.withOpacity(0.5),
                      // fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  config.verticalSpaceSmall(),
                  Row(
                    children: [
                      Text("Shop Name : ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(
                        serviceModel.shopName,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ))
                    ],
                  ),

                  config.verticalSpaceSmall(),
                  Row(
                    children: [
                      Text("Shop Status : ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(
                        serviceModel.shopStatus,
                        style: TextStyle(
                            color: serviceModel.shopStatus == "open"
                                ? Colors.green
                                : Colors.red),
                      ))
                    ],
                  ),
                ],
              )),
              // Column(

              // )

              // Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: config.appHorizontalPaddingSmall()),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           serviceModel.name,
              //           // categoryModel!.name,
              //           style: theme.textTheme.bodyText2
              //               ?.copyWith(fontWeight: FontWeight.w600),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         config.verticalSpaceVerySmall(),
              //         Text(
              //           serviceModel.description,
              //           style: theme.textTheme.bodyText1?.copyWith(
              //               color: theme.colorScheme.secondary,
              //               fontWeight: FontWeight.w600),
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 2,
              //         ),
              //         config.verticalSpaceVerySmall()
              //       ],
              //     )),
            ],
          ),
        ),
      );
    });
  }
}
