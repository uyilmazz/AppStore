import 'dart:ui';
import '../../base/view/base_widget.dart';
import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';
import '../chip/history_element_chip.dart';
import '../textFormField/history_search.dart';
import '../../../view/product/service/product_service.dart';
import '../../../view/product/view_model/product_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
              width: context.width * 0.65,
              height: double.infinity,
              decoration: BoxDecoration(
                color: ColorContants.drawerColor.withOpacity(0.37),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.grey.withOpacity(0.15),
                              Colors.white.withOpacity(0.15),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.lowValue),
                      child: buildContentColumn(context, viewModel))
                ],
              ),
            ));
  }

  Widget buildContentColumn(BuildContext context, ProductViewModel viewModel) =>
      Observer(
          builder: (context) => Column(
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
              ));

  Widget buildSearchTextField(
      BuildContext context, ProductViewModel viewModel) {
    return HistorySearchField(onChanged: (value) async {
      await viewModel.getAllSearchQuery(value);
    });
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
            icon: Icon(Icons.close,
                size: context.normalValue * 1.5, color: Colors.white))
      ],
    );
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
}
