import '../../../core/base/view/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/widgets/container/whislist_product.dart';
import '../../../core/widgets/text/rate_size_text.dart';
import '../service/product_service.dart';
import '../view_model/product_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/widgets/button/icon_button.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
        viewModel: ProductViewModel(ProductService(Dio())),
        onModelReady: (model) {
          model.getProduct();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.normalValue,
                    vertical: context.mediumValue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.normalValue),
                    buildAppBar(context),
                    Expanded(
                      child: Observer(
                          builder: (context) => !viewModel.isLoading
                              ? ListView.builder(
                                  itemCount: viewModel.products.length,
                                  itemBuilder: ((context, index) {
                                    return WishListProduct(
                                        product: viewModel.products[index]);
                                  }))
                              : const Center(
                                  child: CircularProgressIndicator(),
                                )),
                    ),
                  ],
                ),
              ),
            ));
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
