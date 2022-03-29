import 'view/user/view/onboard.dart';
import 'view/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'core/constant/color_constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChangeNotifierProvider<UserViewModel>(
    create: (context) => UserViewModel(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorContants.primaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      title: 'Material App',
      home: const OnBoardPage(),
    );
  }
}
