import '../../../view/product/view/product_detail.dart';
import 'package:flutter/material.dart';
import '../../../view/product/model/product.dart';
import '../../extension/context_extension.dart';
import '../row/product_info_row.dart';

class WishListProduct extends StatelessWidget {
  final Product product;
  const WishListProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: context.normalValue * 1.5),
        height: context.height * 0.11,
        child: ProductInfoRow(product: product, width: context.width * 0.24),
      ),
    );
  }
}
