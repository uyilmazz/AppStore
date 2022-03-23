import '../../extension/context_extension.dart';
import '../../extension/string_extension.dart';
import '../../../view/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

import '../../../view/product/model/product.dart';
import '../../../view/product/view/product_detail.dart';
import '../clipRRect/custom_product_profile.dart';

class TrendContainer extends StatelessWidget {
  final Product product;
  final ProductViewModel viewModel;
  const TrendContainer(
      {Key? key, required this.product, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: context.lowValue),
      margin: EdgeInsets.only(right: context.normalValue),
      width: context.width * 0.43,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetail(
                                  product: product,
                                )));
                  },
                  child: ProductProfileImage(imageUrl: product.images?[0]))),
          SizedBox(height: context.lowValue),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(product.name ?? '',
                style: context.textTheme.subtitle2!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
