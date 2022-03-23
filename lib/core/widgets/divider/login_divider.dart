import 'package:app_store/core/constant/color_constant.dart';
import 'package:app_store/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

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
