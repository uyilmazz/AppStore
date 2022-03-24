import 'view/user/service/user_service.dart';
import 'view/user/view/onboard.dart';
import 'view/user/view_model/user_view_model.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'core/constant/color_constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => UserViewModel(userService: UserService(Dio())),
    child: const MyApp()));

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
