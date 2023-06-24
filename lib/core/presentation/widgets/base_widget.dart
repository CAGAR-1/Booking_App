import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_fresha/core/utils/size_config.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizeConfig config, ThemeData themeData) builder;
  const BaseWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig(context);
    final themedata = Theme.of(context);
    return builder(context, config, themedata);
  }
}

class HookBaseWidget extends HookWidget {
  final Widget Function(
      BuildContext context, SizeConfig config, ThemeData themeData) builder;
  const HookBaseWidget( {super.key,required this.builder});

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig(context);
    final themedata = Theme.of(context);
    return builder(context, config, themedata);
  }
}
