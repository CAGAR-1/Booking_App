import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_fresha/core/data/data_source/remote/api_constant.dart';
import 'package:go_fresha/core/presentation/resources/ui_assets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String? localImagePath;
  final BoxFit? fit;
  final double? aspectRatio;
  final bool IsCompleteUrl;

  const CustomCachedNetworkImage(this.imageUrl,
      {this.localImagePath,
      Key? key,
      this.fit,
      this.aspectRatio,
      this.IsCompleteUrl = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${APIPathHelper.baseUrl}/$imageUrl",
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: aspectRatio ?? 1,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider, fit: fit ?? BoxFit.cover)),
        ),
      ),
      placeholder: (context, url) => AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          UiAssets.gifLoading,
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) =>
          AspectRatio(aspectRatio: 1, child: Text("Error happend")),
    );
  }
}
