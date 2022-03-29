import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';

class CustomFittedBox extends StatelessWidget {
  final String text;
  const CustomFittedBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text,
          style: context.textTheme.labelMedium!.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorContants.textColor)),
    );
  }
}
