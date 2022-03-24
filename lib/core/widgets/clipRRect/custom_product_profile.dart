import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';
import '../../extension/string_extension.dart';

class ProductProfileImage extends StatelessWidget {
  final String? imageUrl;
  const ProductProfileImage({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: imageUrl != null
          ? Image(image: NetworkImage(imageUrl!.networkUrl()), fit: BoxFit.fill)
          : Image(image: AssetImage('fortnite_main'.toPng), fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(context.lowValue),
    );
  }
}
