import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';
import '../row/product_info_row.dart';
import 'package:flutter/material.dart';

import '../../../view/product/model/product.dart';
import '../button/icon_button.dart';
import '../clipRRect/custom_product_profile.dart';
import '../text/rate_size_text.dart';

class WishListProduct extends StatelessWidget {
  final Product product;
  const WishListProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.normalValue * 1.5),
      height: context.height * 0.11,
      child: ProductInfoRow(product: product, width: context.width * 0.24),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        CustomIconButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            }),
        Text('WishList',
            style: context.textTheme.headline5!.copyWith(color: Colors.white)),
      ],
    );
  }
}
