import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';

class RateDownloadWrap extends StatelessWidget {
  final String? text;
  final String value;
  final IconData? icon;

  const RateDownloadWrap({Key? key, this.text, required this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.lowValue * 0.5,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        Wrap(
          children: [
            Text(text ?? '', style: context.textTheme.subtitle1!),
            icon != null
                ? Icon(icon, color: Colors.white, size: context.height * 0.02)
                : const SizedBox(),
          ],
        ),
        Text(value,
            style: context.textTheme.subtitle2!
                .copyWith(color: ColorContants.textColor)),
      ],
    );
  }
}
