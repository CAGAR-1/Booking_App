import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_fresha/core/presentation/resources/ui_assets.dart';

class ShimmerWidget {
  static Widget rounded(
          {final double? width,
          final double? height,
          final double? borderradius}) =>
      _RoundedShimmer(
        borderradius: borderradius,
        height: height,
        width: width,
      );
  static Widget circular({double? radius}) => _CircularShimmer(
        radius: radius,
      );
}

class _CircularShimmer extends StatelessWidget {
  final double? radius;
  const _CircularShimmer({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 30,
      backgroundImage: const AssetImage(UiAssets.gifLoading),
    );
  }
}

class _RoundedShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderradius;
  const _RoundedShimmer(
      {super.key, this.width, this.height, this.borderradius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderradius ?? 8),
        child: Image.asset(
          UiAssets.gifLoading,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
