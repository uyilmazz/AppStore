import 'package:flutter/material.dart';
import '../../../view/product/model/product.dart';
import '../../../view/product/view/product_detail.dart';
import '../../../view/product/view_model/product_view_model.dart';
import '../../extension/context_extension.dart';
import '../clipRRect/custom_product_profile.dart';
import '../row/product_info_row.dart';

class GamesContainer extends StatelessWidget {
  final Product product;
  final ProductViewModel viewModel;
  const GamesContainer(
      {Key? key, required this.product, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.normalValue),
      width: context.width * 0.65,
      child: Column(
        children: [
          Expanded(flex: 14, child: buildMainProductImage(context)),
          const Spacer(),
          Expanded(
            flex: 4,
            child: ProductInfoRow(product: product),
          )
        ],
      ),
    );
  }

  GestureDetector buildMainProductImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      product: product,
                    )));
      },
      child: ProductProfileImage(imageUrl: product.images?[0]),
    );
  }
}
