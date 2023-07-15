import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_fresha/feature/services/data/model/response/service_model.dart';
import 'package:go_fresha/feature/shared/layouts/service_card.dart';

class ServiceListViewBuilder extends StatelessWidget {
  final List<ServiceModel> serviceList;

  ServiceListViewBuilder({super.key, required this.serviceList});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(serviceList.length, (index) {
          final service = serviceList[index];
          return ServiceCard.large(
              serviceModel: service,
              onWishlistButtonClick: () {},
              oncartButtonClick: () {});
        }));
  }
}
