import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/order.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/utils/static_orders.dart';
import 'package:washly/views/components/drawer.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/enter_address_screen.dart';
import 'package:washly/views/screens/help_screen.dart';
import 'package:washly/views/screens/loading_screen.dart';
import 'package:washly/views/screens/on_road_order_screen.dart';
import 'package:washly/views/screens/searching_scrubber_screen.dart';

import '../../controllers/homeController.dart';
import '../components/loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Builder(
        builder: (context) {
          return GetBuilder<HomeController>(
            init:HomeController(),
            builder: (controller) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: CustomAppBar(
                    hasDrawer: true,
                    context: context,
                    hasActions: true,
                    onPres: () {
                      Scaffold.of(context).openDrawer();
                    }),
                drawerEnableOpenDragGesture: false,
                drawer: CustomDrawer(client:controller.client!),
                body:  LoadingScreen(
                        loading: controller.loading.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            width: 375.w,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: SingleChildScrollView(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.verticalSpace,
                                  Text(controller.greeting!,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 36.sp,
                                              fontWeight: FontWeight.w600))
                                      .tr(),
                                  10.verticalSpace,
                                  Text(
                                    controller.client!.client_full_name,
                                    style: TextStyle(
                                        fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                  30.verticalSpace,
                                  DropdownButtonFormField<Order>(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12.r)),
                                    ),
                                    onChanged: (newValue) {},
                                    value: orders[0],
                                    items: orders
                                        .map<DropdownMenuItem<Order>>((Order value) {
                                      return DropdownMenuItem<Order>(
                                        value: value,
                                        child: Container(
                                            width: 270.w,
                                            margin: EdgeInsets.only(bottom: 5.h),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8.r),
                                                  child: Image.asset(
                                                    value.orderCar!.carPicture!,
                                                    width: 51.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                15.horizontalSpace,
                                                Text(value.orderCar!.carName!)
                                              ],
                                            )),
                                      );
                                    }).toList(),
                                  ),
                                  30.verticalSpace,
                                  Image.asset(
                                    "assets/images/welcomimagex4.png",
                                    width: 250.w,
                                  ),
                                  30.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur. Metus cursus dictum enim purus tellus",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ),
                                  30.verticalSpace,
                                  PrimaryButton(
                                    text: "searchcarwash",
                                    onpress: () {
                                      Get.to(() => EneterAddressScreen(),
                                          transition: Transition.rightToLeft);
                                    },
                                    icon: Icon(Boxicons.bx_link_external),
                                  ),
                                  15.verticalSpace,
                                  PrimaryButton(
                                    text: "scheduledcarwash",
                                    onpress: () {},
                                    icon: Icon(Boxicons.bx_timer),
                                    color: secondaryColor,
                                  ),
                                  15.verticalSpace,
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Get.to(() => HelpScreen(),
                                              transition: Transition.rightToLeft);
                                        },
                                        child: Text(
                                          "needhelp",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 14.sp),
                                        ).tr()),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ),
                      )
                  
              );
            }
          );
        }
      ),
    );
  }
}
