import 'package:app_store/view/user/view/login_page.dart';
import 'package:app_store/view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'core/constant/color_constant.dart';
import 'view/product/view/product_detail.dart';
import 'view/product/view/product_view.dart';
import 'view/product/view/wishlist_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => UserViewModel(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorContants.primaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.pink,
              )),
      title: 'Material App',
      home: const LoginPage(),
    );
  }
}
