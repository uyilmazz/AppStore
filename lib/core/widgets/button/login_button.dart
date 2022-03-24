import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CustomLoginButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.mediumValue)),
            textStyle: context.textTheme.headline6!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
            primary: ColorContants.primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: context.mediumValue * 2,
                vertical: context.normalValue)),
        onPressed: onTap ?? () {},
        child: Text(text));
  }
}
