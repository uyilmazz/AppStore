import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/color_constant.dart';
import '../../../core/constant/image_contants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/widgets/button/login_button.dart';
import '../../../core/widgets/button/login_menu_button.dart';
import '../../../core/widgets/divider/login_divider.dart';
import '../../../core/widgets/showDialog/login_show_dialog.dart';
import '../../../core/widgets/textFormField/login_text_form_field.dart';
import '../../product/view/product_view.dart';
import '../view_model/user_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.mediumValue),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  buildLoginImage(context),
                  SizedBox(height: context.lowValue),
                  Column(
                    children: [
                      SizedBox(height: context.lowValue),
                      buildMenuBar(context),
                      SizedBox(height: context.height * 0.03),
                      buildFormContainer(provider, context),
                      SizedBox(height: context.normalValue),
                      buildLoginButton(provider, context)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildLoginImage(BuildContext context) {
    return SizedBox(
        height: context.height * 0.25,
        child: SvgPicture.asset(ImageConstants.instance.loginSvg));
  }

  Container buildMenuBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.lowValue),
      width: context.width * 0.8,
      height: context.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.mediumValue * 1.5),
          color: ColorContants.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginMenuButton(
              text: 'Login',
              containerColor: context.watch<UserViewModel>().isLogin
                  ? Colors.white
                  : Colors.transparent,
              textColor: context.watch<UserViewModel>().isLogin
                  ? ColorContants.primaryColor
                  : Colors.white),
          LoginMenuButton(
              text: 'Register',
              containerColor: !context.watch<UserViewModel>().isLogin
                  ? Colors.white
                  : Colors.transparent,
              textColor: !context.watch<UserViewModel>().isLogin
                  ? ColorContants.primaryColor
                  : Colors.white),
        ],
      ),
    );
  }

  Container buildFormContainer(UserViewModel provider, BuildContext context) =>
      Container(
        padding: EdgeInsets.all(context.normalValue),
        width: context.width * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: ColorContants.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(context.normalValue)),
        child: buildForm(provider, context),
      );

  Widget buildForm(UserViewModel provider, BuildContext context) => Form(
        key: formKey,
        child: Column(
          children: [
            !context.watch<UserViewModel>().isLogin
                ? LoginTextFormField(
                    hintText: 'Name',
                    leadingIcon: Icons.person_outline_outlined,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name must is not empty!';
                      } else {
                        return null;
                      }
                    })
                : const SizedBox(),
            !context.watch<UserViewModel>().isLogin
                ? const LoginDivider()
                : const SizedBox(),
            LoginTextFormField(
                hintText: 'Email Address',
                leadingIcon: Icons.email_outlined,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email Address is not empty!';
                  } else if (!value.emailRegex) {
                    return 'Email is not in correct format';
                  }
                  return null;
                }),
            const LoginDivider(),
            LoginTextFormField(
                hintText: 'Password',
                leadingIcon: Icons.lock,
                controller: passwordController,
                obscure: true,
                suffixIcon: Icons.visibility_outlined,
                onTap: () {},
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password must is not empty!';
                  }
                  return null;
                }),
            !context.watch<UserViewModel>().isLogin
                ? const LoginDivider()
                : const SizedBox(),
            !context.watch<UserViewModel>().isLogin
                ? LoginTextFormField(
                    hintText: 'Confirm Password',
                    leadingIcon: Icons.lock,
                    controller: confirmPasswordController,
                    obscure: true,
                    suffixIcon: Icons.visibility_outlined,
                    onTap: () {},
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Confirm Password must is not empty!';
                      } else if (passwordController?.text !=
                          confirmPasswordController?.text) {
                        return 'Confirm password is not the same as password';
                      }
                      return null;
                    })
                : const SizedBox(),
          ],
        ),
      );

  Widget buildLoginButton(UserViewModel provider, BuildContext context) =>
      CustomLoginButton(
          text: context.watch<UserViewModel>().isLogin ? 'Login' : 'Register',
          onTap: () async {
            if (formKey.currentState!.validate()) {
              final response = !context.read<UserViewModel>().isLogin
                  ? await provider.registerUser(nameController!.text,
                      emailController!.text, passwordController!.text)
                  : await provider.loginUser(
                      emailController!.text, passwordController!.text);
              if (response) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProductView()));
              } else {
                buildShowDialog(context);
              }
            }
          });

  buildShowDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginShowDialog(
            text: context.read<UserViewModel>().isLogin
                ? 'Email or Password is not correct!'
                : 'Email is already exists!');
      });
}
