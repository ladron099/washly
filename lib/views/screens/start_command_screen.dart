import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/startCommandController.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/feedback_screen.dart';

class StartCommandScreen extends StatelessWidget {
  const StartCommandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<StartCommandController>(
          init: StartCommandController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    50.verticalSpace,
                    Image.asset(
                      "assets/images/rlogo.png",
                      width: 70.w,
                    ),
                    25.verticalSpace,
                    Text(
                      "orderstartsnow",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: primaryColor),
                    ).tr(),
                    25.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProgressWidget(
                          text: "start",
                          index: 1,
                          filled: true,
                        ),
                        ProgressWidget(
                          text: "almostdone",
                          index: 2,
                          filled: controller.filled2,
                        ),
                        ProgressWidget(
                          text: "done",
                          index: 3,
                          filled: controller.filled3,
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Divider(
                      color: primaryColor,
                      thickness: 2.sp,
                    ),
                    15.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_current_location,
                            color: primaryColor,
                          ),
                          5.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "address",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ).tr(),
                              18.verticalSpace,
                              Text(
                                "Rue de far 12, Casablanca, Morocco",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Divider(
                      color: primaryColor,
                      thickness: 2.sp,
                    ),
                    15.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_gift,
                            color: primaryColor,
                          ),
                          5.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "paymentdetails",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ).tr(),
                              18.verticalSpace,
                              Container(
                                width: 290.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "paymentmethod",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ).tr(),
                                    Text(
                                      "Cash",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              15.verticalSpace,
                              Container(
                                width: 290.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "total",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ).tr(),
                                    Text(
                                      "53.00 MAD",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Container(
                  height: 150.h,
                  alignment: Alignment.center,
                  color: primaryColor,
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        "Abdessamad Berahhou",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                    subtitle: Text(
                      "ID: A895965656",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    leading: Image.asset("assets/images/profile.png"),
                    trailing: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: secondaryColor),
                        width: 45.w,
                        height: 45.w,
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => FeedbackScreen(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Boxicons.bx_phone_call),
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            );
          }),
    );
  }
}
