import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1,
        height: context.height * 0.04,
        color: ColorContants.secondaryColor);
  }
}
