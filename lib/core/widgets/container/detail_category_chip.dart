import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class DetailCategoryContainer extends StatelessWidget {
  final String categoryName;
  const DetailCategoryContainer({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.lowValue, vertical: context.lowValue * 0.6),
        decoration: BoxDecoration(
            color: ColorContants.buttonColor,
            borderRadius: BorderRadius.circular(context.lowValue * 0.5)),
        child: Text(
          categoryName,
          style: context.textTheme.subtitle2!.copyWith(color: Colors.white),
        ));
  }
}


// Text(
//                             e.name ?? '',
//                             style: context.textTheme.subtitle2!
//                                 .copyWith(color: Colors.white),
//                           )