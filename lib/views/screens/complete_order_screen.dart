import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/review_checkout_scree.dart';

import '../../controllers/completeOrderController.dart';
import '../../utils/buttons.dart';
import '../../utils/services.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: CustomAppBar(
          hasTitle: true, title: "services", subTitle: "chooseyourservice"),
      body: GetBuilder<CompleteOrderController>(
          init: CompleteOrderController(),
          builder: (controller) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    22.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CarWidget(
                        order: controller.order,
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
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
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "address",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              12.verticalSpace,
                              Text(
                                "Rue de far 12, Casablanca, Morocco",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_credit_card,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "paymentmethod",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              18.verticalSpace,
                              InkWell(
                                onTap: () {
                                  controller.isCashSelected = true;
                                  controller.isCardSelected = false;
                                  controller.isWahslyCoinsSelected = false;
                                  controller.update();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 13.w,
                                      width: 13.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        border: Border.all(
                                          color: controller.isCashSelected
                                              ? primaryColor
                                              : borderGreyColor,
                                          width: 3.w,
                                        ),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      "cash",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                              ),
                              20.verticalSpace,
                              InkWell(
                                onTap: () {
                                  controller.isCashSelected = false;
                                  controller.isCardSelected = true;
                                  controller.isWahslyCoinsSelected = false;
                                  controller.update();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 13.w,
                                      width: 13.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        border: Border.all(
                                          color: controller.isCardSelected
                                              ? primaryColor
                                              : borderGreyColor,
                                          width: 3.w,
                                        ),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      "card",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ).tr(),
                                    5.horizontalSpace,
                                    Text(
                                      "(-5%)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              20.verticalSpace,
                              InkWell(
                                onTap: () {
                                  controller.isCashSelected = false;
                                  controller.isCardSelected = false;
                                  controller.isWahslyCoinsSelected = true;
                                  controller.update();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 13.w,
                                      width: 13.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        border: Border.all(
                                          color:
                                              controller.isWahslyCoinsSelected
                                                  ? primaryColor
                                                  : borderGreyColor,
                                          width: 3.w,
                                        ),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      "washlycoin",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ).tr(),
                                    5.horizontalSpace,
                                    Text(
                                      "(-10%)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    21.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_gift,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          SizedBox(
                            width: 280.w,
                            child: Text(
                              "coupon",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ).tr(),
                          ),
                        ],
                      ),
                    ),
                    18.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFieldPrimary(
                          hint: 'coupon',
                          inputIcon: Icon(Boxicons.bxs_coupon),
                          visible: false),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: InkWell(
                        onTap: () {
                          controller.isCheckBoxSelected =
                              !controller.isCheckBoxSelected;
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 19.w,
                              height: 19.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: controller.isCheckBoxSelected
                                        ? primaryColor
                                        : borderGreyColor,
                                    width: 4.w),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            10.horizontalSpace,
                            Text(
                              'iwillbepresent',
                              style: TextStyle(
                                color: controller.isCheckBoxSelected
                                    ? primaryColor
                                    : borderGreyColor,
                                fontSize: 15.sp,
                              ),
                            ).tr(),
                            5.horizontalSpace,
                            Icon(Boxicons.bx_info_circle,
                                size: 15.sp, color: borderGreyColor)
                          ],
                        ),
                      ),
                    ),
                    80.verticalSpace,
                    SizedBox(
                        width: 260.w,
                        height: 49.h,
                        child: PrimaryButton(
                            reverse: false,
                            text: "next",
                            color: primaryColor,
                            onpress: () {
                              if (controller.isCheckBoxSelected == false) {
                                Get.snackbar("error", "Please check the box",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: redColor);
                              } else {
                                Get.to(() => ReviewCheckOutScreen(),
                                    transition: Transition.rightToLeft);
                              }
                            })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
