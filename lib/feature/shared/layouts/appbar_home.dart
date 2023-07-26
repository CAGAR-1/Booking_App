import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/base_widget.dart';

class SearchBarContainer extends StatelessWidget
    implements PreferredSizeWidget {
  final Color? fillColor;
  final VoidCallback onPressed;

  const SearchBarContainer({
    Key? key,
    this.fillColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BaseWidget(builder: (context, config, theme) {
        return Container(
          padding: EdgeInsets.only(
              left: config.appHorizontalPaddingMedium(),
              right: config.appHorizontalPaddingSmall()),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: fillColor ?? const Color(0xfff2f2f2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search entire store here...',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xffABA8A8)),
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.yellow.withOpacity(0.5),
                  child: const Icon(Icons.search)),
            ],
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
