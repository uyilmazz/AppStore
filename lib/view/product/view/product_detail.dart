import '../../../core/constant/color_constant.dart';
import '../../../core/constant/image_contants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/widgets/container/detail_category_chip.dart';
import '../../../core/widgets/container/detail_page_view_image.dart';
import '../../../core/widgets/row/head_text_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/button/icon_button.dart';
import '../../../core/widgets/container/custom_divider.dart';
import '../../../core/widgets/wrap/rate_download.dart';
import '../model/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            buildBackImage(context),
            buildProductDetail(context),
          ],
        ),
      ),
    );
  }

  Padding buildProductDetail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.normalValue, vertical: context.mediumValue),
      child: Column(
        children: [
          buildAppBar(context),
          SizedBox(height: context.height * 0.14),
          buildImageInstallRow(context),
          SizedBox(height: context.height * 0.04),
          buildRateSizeDownloadRow(context),
          SizedBox(height: context.height * 0.04),
          Expanded(child: buildImagePageView(context)),
          SizedBox(height: context.height * 0.01),
          HeadTextIcon(text: 'Description', onPressed: () {}),
          buildDescription(context),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: context.normalValue,
              children: product.category != null
                  ? product.category!
                      .map((e) =>
                          DetailCategoryContainer(categoryName: e.name ?? ''))
                      .toList()
                  : [const SizedBox()],
            ),
          )
        ],
      ),
    );
  }

  SizedBox buildImagePageView(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: (product.images!.length - 2) > 0
          ? PageView.builder(
              itemCount: (product.images!.length - 2),
              itemBuilder: (context, index) {
                return DetailPageViewImage(
                  imageName: product.images![index + 2],
                  productName: product.name!,
                );
              })
          : const Center(
              child: Text('The app has no image.'),
            ),
    );
  }

  SizedBox buildDescription(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: context.height * 0.07,
        child: Text(product.description ?? '',
            style: context.textTheme.labelLarge!
                .copyWith(color: ColorContants.textColor)));
  }

  Row buildRateSizeDownloadRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RateDownloadWrap(
            value: '1M review',
            text: '${product.rate ?? 0} ',
            icon: Icons.star),
        const CustomDivider(),
        RateDownloadWrap(
            value: '${product.size ?? 0} GB',
            icon: Icons.cloud_download_outlined),
        const CustomDivider(),
        RateDownloadWrap(
            value: 'Downloads', text: '${product.downloadCount ?? 0}'),
      ],
    );
  }

  Row buildImageInstallRow(BuildContext context) {
    return Row(
      children: [
        buildProfileImage(context),
        SizedBox(width: context.width * 0.04),
        Expanded(flex: 3, child: buildProdutcInfoColumn(context)),
        SizedBox(width: context.width * 0.04),
        buildInstallButton()
      ],
    );
  }

  Column buildProdutcInfoColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText('${product.name}',
            maxLines: 2,
            style: context.textTheme.headline5!.copyWith(color: Colors.white)),
        SizedBox(height: context.lowValue),
        Text('Producer',
            style: context.textTheme.labelLarge!
                .copyWith(color: ColorContants.buttonColor)),
        Text('In-app purchase',
            style: context.textTheme.labelLarge!
                .copyWith(color: ColorContants.textColor))
      ],
    );
  }

  Widget buildProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.lowValue),
      child: Container(
        height: context.height * 0.12,
        width: context.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.mediumValue)),
        child: product.images?[0] == null
            ? Image(
                image: AssetImage('detail_fortnite'.toPng),
                fit: BoxFit.fill,
              )
            : Image(
                image: NetworkImage(product.images![0].networkUrl()),
                fit: BoxFit.fill,
              ),
      ),
    );
  }

  ElevatedButton buildInstallButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: ColorContants.buttonColor),
        onPressed: () {},
        child: const Text('Install'));
  }

  SizedBox buildBackImage(BuildContext context) {
    return SizedBox(
        height: context.height * 0.3,
        width: double.infinity,
        child: product.images?[1] == null
            ? Image.asset('background'.toPng, fit: BoxFit.fill)
            : Image.network(product.images![1].networkUrl(), fit: BoxFit.fill));
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            }),
        Wrap(
          children: [
            CustomIconButton(
                icon: Icons.favorite,
                onPressed: () {},
                alignment: Alignment.centerRight),
            CustomIconButton(
                icon: Icons.more_vert,
                onPressed: () {},
                alignment: Alignment.centerRight),
          ],
        )
      ],
    );
  }
}
