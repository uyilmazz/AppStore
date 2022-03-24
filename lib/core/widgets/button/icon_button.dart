import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? favoriteColor;
  final Function() onPressed;
  final AlignmentGeometry? alignment;

  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.alignment,
      this.favoriteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        alignment: alignment ?? Alignment.centerLeft,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: context.mediumValue * 0.8,
        ));
  }
}
