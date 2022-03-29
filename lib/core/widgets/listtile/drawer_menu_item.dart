import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';
import '../../extension/string_extension.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String iconName;
  final Function()? onTap;
  const CustomListTile(
      {Key? key,
      required this.text,
      required this.iconName,
      this.onTap,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: context.normalValue * 1.5,
      leading: icon != null
          ? Icon(icon, color: Colors.white, size: context.normalValue * 2)
          : Image.asset(
              iconName.toIconPng,
              width: context.normalValue * 2,
              height: context.normalValue * 2,
              fit: BoxFit.fill,
            ),
      title: Text(text,
          style: context.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.w400)),
    );
  }
}
