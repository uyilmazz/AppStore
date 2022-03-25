import 'package:app_store/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';

class HistoryElementChip extends StatelessWidget {
  final String labelText;
  const HistoryElementChip({Key? key, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -2),
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: context.lowValue * 0.5),
        backgroundColor: const Color(0xFF2F2F2F),
        elevation: 2,
        labelStyle: context.textTheme.labelLarge!.copyWith(
            color: ColorContants.textColor, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFF2F2F2F)),
            borderRadius: BorderRadius.circular(context.lowValue * 1.2)),
        label: Text(labelText));
  }
}
