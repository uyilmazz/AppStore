import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';

class HeadTextIcon extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const HeadTextIcon({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: context.textTheme.headline6),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_outlined,
              size: context.mediumValue,
              color: Colors.white,
            ))
      ],
    );
  }
}
