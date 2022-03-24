import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: ColorContants.primaryColor,
        thickness: 1,
        indent: context.normalValue,
        endIndent: context.normalValue);
  }
}
