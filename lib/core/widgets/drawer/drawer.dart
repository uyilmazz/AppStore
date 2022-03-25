import 'package:app_store/core/extension/context_extension.dart';
import 'package:app_store/core/extension/string_extension.dart';
import 'package:app_store/view/product/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../listtile/drawer_menu_item.dart';
import '../../../view/user/view/login_page.dart';
import '../../../view/user/view_model/user_view_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      child: Drawer(
          backgroundColor: const Color(0xFF141414),
          child: Column(
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
              const CustomListTile(
                  text: 'Notification', iconName: 'notification'),
              const CustomListTile(
                  text: 'Subscription', iconName: 'subscription'),
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
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  }),
              // const CustomListTile(text: 'Logout', iconName: 'logout'),
            ],
          )),
    );
  }
}
