import 'dart:ui';

import 'package:app_store/core/constant/menu_items.dart';
import 'package:app_store/core/extension/string_extension.dart';
import 'package:app_store/core/widgets/listtile/drawer_menu_item.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/widgets/button/icon_button.dart';
import '../../../core/widgets/container/home_trend.dart';
import 'wishlist_page.dart';
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
        drawer: buildDrawer(context),
        body: Observer(
            builder: (context) => viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : DefaultTabController(
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
                                  'New & updated ${viewModel.productTypes[viewModel.tabBarIndex].name}',
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
                              child:
                                  buildTrendingScrollView(context, viewModel)),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  SizedBox buildDrawer(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      child: Drawer(
          backgroundColor: Color(0xFF141414),
          child: Column(
            children: [
              SizedBox(height: context.mediumValue * 2),
              Padding(
                padding: EdgeInsets.only(left: context.normalValue),
                child: Row(
                  children: [
                    Image(
                        fit: BoxFit.fill,
                        width: context.width * 0.15,
                        height: context.height * 0.08,
                        image: AssetImage('detail_fortnite'.toPng)),
                    SizedBox(width: context.normalValue),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name Surname',
                            style: context.textTheme.subtitle1!
                                .copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'name_surname@gmail.com',
                            style: context.textTheme.labelMedium!
                                .copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.normalValue),
              const CustomListTile(text: 'My Library', iconName: 'library'),
              const CustomListTile(
                  text: 'Notification', iconName: 'notification'),
              const CustomListTile(
                  text: 'Subscription', iconName: 'subscription'),
              CustomListTile(
                  text: 'Wishlist',
                  iconName: 'wishlist',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WishListPage()));
                  }),
              const CustomListTile(text: 'Payment', iconName: 'payment'),
              const CustomListTile(text: 'Setting', iconName: 'setting'),
            ],
          )),
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

  Row buildNewHeaderRow(
      BuildContext context, String text, Function() onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: context.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_outlined,
              size: context.mediumValue,
              color: Colors.white,
            ))
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
                color: Color(0xFF0061FD),
              ),
              tabs: viewModel.productTypes
                  .map((type) => Tab(text: type.name))
                  .toList())),
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
            CustomIconButton(
                icon: Icons.notifications_none,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WishListPage()));
                },
                alignment: Alignment.centerRight),
            CustomIconButton(
                icon: Icons.search,
                onPressed: () {},
                alignment: Alignment.centerRight),
          ],
        )
      ],
    );
  }
}
