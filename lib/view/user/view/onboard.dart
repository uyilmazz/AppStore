import '../../../core/extension/context_extension.dart';
import '../../product/view/product_view.dart';
import 'login_page.dart';
import '../view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);
  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<UserViewModel>(context, listen: false).verifyToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<UserViewModel>().isLoading
        ? Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.normalValue),
              child: const Center(child: CircularProgressIndicator()),
            ),
          )
        : context.read<UserViewModel>().isVerified
            ? const ProductView()
            : const LoginPage();
  }
}
