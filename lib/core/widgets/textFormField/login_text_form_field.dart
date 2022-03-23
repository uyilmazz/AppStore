import 'package:app_store/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';

class LoginTextFormField extends StatelessWidget {
  final String hintText;
  final IconData leadingIcon;
  bool obscure;
  TextEditingController? controller;
  String? Function(String? value)? validator;
  IconData? suffixIcon;
  Function()? onTap;

  LoginTextFormField(
      {Key? key,
      required this.hintText,
      required this.leadingIcon,
      this.obscure = false,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.textTheme.subtitle1!.copyWith(
          color: ColorContants.primaryColor, fontWeight: FontWeight.bold),
      validator: validator,
      controller: controller,
      obscureText: obscure,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: context.normalValue * 1.5),
          hintText: hintText,
          hintStyle: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w600, color: ColorContants.secondaryColor),
          prefixIcon: Icon(leadingIcon, color: ColorContants.primaryColor),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onTap,
                  icon: Icon(suffixIcon, color: ColorContants.primaryColor))
              : const SizedBox(),
          border: InputBorder.none),
    );
  }
}
