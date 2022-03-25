import 'package:app_store/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';

class HistorySearchField extends StatelessWidget {
  final Function(String)? onChanged;
  const HistorySearchField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.055,
      child: TextField(
        onChanged: onChanged,
        style: context.textTheme.labelMedium!.copyWith(
            color: ColorContants.textColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2F2F2F),
            isDense: true,
            contentPadding: EdgeInsets.only(right: context.normalValue),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.mediumValue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.mediumValue)),
            prefixIcon: Icon(Icons.search,
                color: ColorContants.textColor,
                size: context.normalValue * 1.4),
            hintText: 'What are you looking for?',
            hintStyle: context.textTheme.labelMedium!.copyWith(
                color: ColorContants.textColor, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
