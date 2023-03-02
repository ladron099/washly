// ignore_for_file: must_be_immutable

import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/choose_car_screen.dart';
import 'package:washly/views/screens/help_screen.dart';
import 'package:washly/views/screens/orders_screen.dart';
import 'package:washly/views/screens/profile_screen.dart';
import 'package:washly/views/screens/share_with_friends_screen.dart';
import 'package:washly/views/screens/wallet_screen.dart';

class CustomDrawer extends StatelessWidget {
  Client client;
  CustomDrawer({required this.client, Key? key}) : super(key: key);
  // final BottomNavBarController widgetController = Get.put(BottomNavBarController());
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey();
    return SafeArea(
        child: Drawer(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.r),
              bottomRight: Radius.circular(40.r))),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      Container(
                          height: 130.h,
                          width: 130.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70.r),
                            child: CachedNetworkImage(
                                imageUrl: client.client_picture,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      'assets/images/default.png',
                                      fit: BoxFit.cover,
                                    )),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        client.client_full_name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      18.verticalSpace,
                      Container(
                        height: 2.h,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                DrawerItem(
                  title: 'home',
                  onTap: () {
                    Get.back();
                  },
                ),
                DrawerItem(
                  title: 'orders',
                  icon: Boxicons.bx_package,
                  onTap: () {
                    Get.back();
                    Get.to(() => OrdersScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                DrawerItem(
                  title: 'profile',
                  icon: Boxicons.bx_user,
                  onTap: () {
                    Get.back();
                    Get.to(() => ProfileScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                DrawerItem(
                  title: 'cars',
                  icon: Boxicons.bx_car,
                  onTap: () {
                    Get.back();
                    Get.to(() => ChooseCarScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                DrawerItem(
                  title: 'wallet',
                  icon: Boxicons.bx_wallet,
                  onTap: () {
                    Get.back();
                    Get.to(() => WalletScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                DrawerItem(
                  title: 'sharewithfriends',
                  icon: Boxicons.bx_share_alt,
                  onTap: () {
                    Get.back();
                    Get.to(() => ShareWithFriendsScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                DrawerItem(
                  title: 'help',
                  icon: Boxicons.bx_help_circle,
                  onTap: () {
                    Get.back();
                    Get.to(() => HelpScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: DrawerItem(
                title: 'logout',
                icon: Boxicons.bx_log_out,
                onTap: () {
                  logoutDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class DrawerItem extends StatelessWidget {
  IconData? icon;
  String? title;
  void Function()? onTap;
  DrawerItem({
    this.icon,
    this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: ListTile(
        leading: Icon(
          icon ?? Boxicons.bx_home,
          color: Colors.white,
        ),
        title: Text(
          title!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ).tr(),
      ),
    );
  }
}
