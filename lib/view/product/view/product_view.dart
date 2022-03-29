import '../../../core/constant/color_constant.dart';
import '../../../core/widgets/drawer/end_drawer.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/widgets/button/icon_button.dart';
import '../../../core/widgets/container/home_trend.dart';
import '../../../core/widgets/drawer/drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/widgets/container/home_product.dart';
import '../../../core/widgets/row/head_text_icon.dart';
import '../service/product_service.dart';
import '../view_model/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      viewModel: ProductViewModel(ProductService(Dio())),
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const CustomDrawer(),
        endDrawer: const CustomEndDrawer(),
        body: Observer(
            builder: (context) => DefaultTabController(
                  length: viewModel.productTypes.length,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.normalValue,
                        vertical: context.mediumValue),
                    child: Column(
                      children: [
                        buildAppBar(context),
                        SizedBox(height: context.height * 0.02),
                        buildTabBar(context, viewModel),
                        SizedBox(height: context.height * 0.01),
                        HeadTextIcon(
                            text:
                                'New & updated ${(viewModel.productTypes.isNotEmpty) ? viewModel.productTypes[viewModel.tabBarIndex].name : ''}',
                            onPressed: () {}),
                        SizedBox(height: context.height * 0.01),
                        Expanded(
                            flex: 4,
                            child: buildGamesScrollView(context, viewModel)),
                        SizedBox(height: context.height * 0.01),
                        HeadTextIcon(text: 'On trending', onPressed: () {}),
                        SizedBox(height: context.height * 0.02),
                        Expanded(
                            flex: 3,
                            child: buildTrendingScrollView(context, viewModel)),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
            icon: Icons.menu,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }),
        Wrap(
          children: [
            const CustomIconButton(
                icon: Icons.notifications_none,
                alignment: Alignment.centerRight),
            CustomIconButton(
                icon: Icons.search,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                alignment: Alignment.centerRight),
          ],
        )
      ],
    );
  }

  Widget buildTabBar(BuildContext context, ProductViewModel viewModel) {
    return SizedBox(
      height: context.mediumValue,
      child: Observer(
          builder: (context) => TabBar(
              onTap: (index) {
                viewModel.changeTabBar(index);
              },
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              labelStyle: context.theme.textTheme.subtitle2!
                  .copyWith(fontWeight: FontWeight.bold),
              isScrollable: true,
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: context.lowValue * 0.8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(context.normalValue),
                color: ColorContants.buttonColor,
              ),
              tabs: viewModel.productTypes
                  .map((type) => Tab(text: type.name))
                  .toList())),
    );
  }

  Widget buildGamesScrollView(
          BuildContext context, ProductViewModel viewModel) =>
      Observer(
          builder: (context) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.updatedProduct.length,
              itemBuilder: (context, index) {
                return GamesContainer(
                  product: viewModel.updatedProduct[index],
                  viewModel: viewModel,
                );
              }));

  Widget buildTrendingScrollView(
          BuildContext context, ProductViewModel viewModel) =>
      Observer(
          builder: (context) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.trends.length,
              itemBuilder: (context, index) {
                return TrendContainer(
                    product: viewModel.trends[index], viewModel: viewModel);
              }));
}
