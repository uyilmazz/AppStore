import 'package:app_store/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../button/login_button.dart';

class LoginShowDialog extends StatelessWidget {
  final String text;
  const LoginShowDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(context.normalValue)), //this right here
      child: SizedBox(
        height: context.height * 0.25,
        child: Padding(
          padding: EdgeInsets.all(context.lowValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                textAlign: TextAlign.center,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: text),
              ),
              SizedBox(
                height: context.height * 0.07,
                width: context.width * 0.5,
                child: CustomLoginButton(
                    text: 'OK',
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
