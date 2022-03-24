import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view/user/view_model/user_view_model.dart';

class LoginMenuButton extends StatelessWidget {
  final String text;
  final Color containerColor;
  final Color textColor;
  const LoginMenuButton(
      {Key? key,
      required this.text,
      required this.containerColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        text == 'Login'
            ? context.read<UserViewModel>().isLoginChange(true)
            : context.read<UserViewModel>().isLoginChange(false);
      },
      child: Container(
        width: context.width * 0.35,
        height: context.height * 0.08,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(context.mediumValue * 1.5)),
        child: Align(
            alignment: Alignment.center,
            child: Text(text,
                style: context.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
