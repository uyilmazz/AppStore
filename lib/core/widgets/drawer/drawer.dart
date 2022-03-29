import 'dart:ui';
import '../../constant/color_constant.dart';
import '../../extension/context_extension.dart';
import '../../extension/string_extension.dart';
import '../../../view/product/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../listtile/drawer_menu_item.dart';
import '../../../view/user/view/login_page.dart';
import '../../../view/user/view_model/user_view_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.symmetric(horizontal: context.lowValue),
              child: buildContentColumn(context))
        ],
      ),
    );
  }

  Column buildContentColumn(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.mediumValue * 2),
        Padding(
          padding: EdgeInsets.only(left: context.normalValue),
          child: Row(
            children: [
              Image(
                  fit: BoxFit.fill,
                  width: context.width * 0.15,
                  height: context.height * 0.08,
                  image: AssetImage('detail_fortnite'.toPng)),
              SizedBox(width: context.normalValue),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.read<UserViewModel>().user?.name ?? '',
                        style: context.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                    Text(context.read<UserViewModel>().user?.email ?? '',
                        style: context.textTheme.labelMedium!
                            .copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.normalValue),
        const CustomListTile(text: 'My Library', iconName: 'library'),
        const CustomListTile(text: 'Notification', iconName: 'notification'),
        const CustomListTile(text: 'Subscription', iconName: 'subscription'),
        CustomListTile(
            text: 'Wishlist',
            iconName: 'wishlist',
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WishListPage()));
            }),
        const CustomListTile(text: 'Payment', iconName: 'payment'),
        const CustomListTile(text: 'Setting', iconName: 'setting'),
        CustomListTile(
            text: 'Logout',
            icon: Icons.logout,
            iconName: 'Logout',
            onTap: () async {
              context.read<UserViewModel>().logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            }),
        // const CustomListTile(text: 'Logout', iconName: 'logout'),
      ],
    );
  }
}
