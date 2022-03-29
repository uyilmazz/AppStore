import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';
import '../../extension/string_extension.dart';

class DetailPageViewImage extends StatelessWidget {
  final String imageName;
  final String productName;
  const DetailPageViewImage(
      {Key? key, required this.imageName, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      height: context.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageName.networkUrl()), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(context.normalValue)),
    );
  }
}
