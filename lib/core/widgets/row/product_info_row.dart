import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../view/product/model/product.dart';
import '../../constant/color_constant.dart';
import '../clipRRect/custom_product_profile.dart';
import '../text/custom_fitted_box.dart';

class ProductInfoRow extends StatelessWidget {
  final Product product;
  final double? width;
  const ProductInfoRow({Key? key, required this.product, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: double.infinity,
            width: width ?? context.width * 0.2,
            child: ProductProfileImage(imageUrl: product.images?[1])),
        SizedBox(width: context.normalValue),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildProductNameText(context),
              Row(
                children: [
                  Flexible(child: buildCategoryText(context, 0)),
                  Flexible(child: buildCategoryText(context, 1)),
                  Flexible(child: buildCategoryText(context, 2)),
                ],
              ),
              builRateAndSizeRow(context),
            ],
          ),
        )
      ],
    );
  }

  FittedBox buildProductNameText(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(product.name ?? '',
          style: context.textTheme.subtitle1!
              .copyWith(fontWeight: FontWeight.w500)),
    );
  }

  Widget buildCategoryText(BuildContext context, int categoryItemNumber) {
    return CustomFittedBox(
        text: (product.category?[categoryItemNumber].name != null
            ? '${categoryItemNumber == 0 ? '' : ' - '}${product.category?[categoryItemNumber].name}'
            : ''));
  }

  Row builRateAndSizeRow(BuildContext context) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CustomFittedBox(
                text:
                    '${product.rate != null ? product.rate!.toStringAsFixed(1) : 0} '),
            Icon(Icons.star,
                color: ColorContants.secondaryColor, size: context.lowValue)
          ],
        ),
        SizedBox(width: context.lowValue),
        CustomFittedBox(
            text:
                '${product.size != null ? product.size!.toStringAsFixed(1) : 0} GB'),
      ],
    );
  }
}
