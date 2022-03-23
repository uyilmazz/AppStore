import 'package:app_store/core/extension/context_extension.dart';
import 'package:app_store/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final String iconName;
  final Function()? onTap;
  const CustomListTile(
      {Key? key, required this.text, required this.iconName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: context.normalValue * 1.5,
      leading: Image.asset(
        iconName.toIconPng,
        width: context.normalValue * 2,
        height: context.normalValue * 2,
        fit: BoxFit.fill,
      ),
      title: Text(text,
          style: context.textTheme.subtitle1!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
    );
  }
}
