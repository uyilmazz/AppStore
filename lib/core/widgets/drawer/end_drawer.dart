import 'dart:ui';
import 'package:app_store/core/base/view/base_widget.dart';
import 'package:app_store/core/extension/context_extension.dart';
import 'package:app_store/core/widgets/chip/history_element_chip.dart';
import 'package:app_store/core/widgets/textFormField/history_search.dart';
import 'package:app_store/view/product/service/product_service.dart';
import 'package:app_store/view/product/view_model/product_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../constant/color_constant.dart';
import '../../constant/items.dart';
import '../row/product_info_row.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
        viewModel: ProductViewModel(ProductService(Dio())),
        onModelReady: (model) {},
        onPageBuilder: (context, viewModel) => Container(
              padding: EdgeInsets.symmetric(horizontal: context.lowValue),
              height: double.infinity,
              width: context.width * 0.7,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Drawer(
                    backgroundColor: const Color(0xFF141414).withAlpha(37),
                    child: Observer(
                        builder: (context) =>
                            buildContentColumn(context, viewModel))),
              ),
            ));
  }

  Column buildContentColumn(BuildContext context, ProductViewModel viewModel) {
    return Column(
      children: [
        SizedBox(height: context.mediumValue * 2),
        buildSearchTextField(context, viewModel),
        SizedBox(height: context.normalValue * 1.2),
        viewModel.searchList == null
            ? Column(
                children: [
                  buildRowHistoryHead(context),
                  buildWrapHistoryElements(context)
                ],
              )
            : viewModel.searchList!.isEmpty
                ? const Text('Not Found content')
                : Expanded(child: buildSearchProduct(viewModel))
      ],
    );
  }

  ListView buildSearchProduct(ProductViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.searchList!.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(bottom: context.normalValue),
              height: context.height * 0.08,
              width: context.width * 0.65,
              child: ProductInfoRow(product: viewModel.searchList![index]));
        });
  }

  Wrap buildWrapHistoryElements(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: context.normalValue,
      runSpacing: context.lowValue * 0.5,
      children: DrawerConstant.historyItme
          .map((e) => HistoryElementChip(labelText: e))
          .toList(),
    );
  }

  Row buildRowHistoryHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('History',
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w500)),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.close,
              size: context.normalValue * 1.5,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget buildSearchTextField(
      BuildContext context, ProductViewModel viewModel) {
    return HistorySearchField(onChanged: (value) {
      value.trim().isNotEmpty
          ? viewModel.getAllSearchQuery(value)
          : viewModel.searchListNull();
    });
  }
}
