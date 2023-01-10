import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/complete_order_screen.dart';

import '../../controllers/ServicesController.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            hasTitle: true, title: "services", subTitle: "chooseyourservice"),
        body: GetBuilder<ServicesController>(
            init: ServicesController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    15.verticalSpace,
                    SizedBox(
                      height: 610.h,
                      child: ListView.builder(
                          itemCount: controller.filtredServices.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.switchIndex(index);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.only(top: 12.h),
                                  height: 140.h,
                                  width: 335.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                        color: controller.currIndex == index
                                            ? primaryColor
                                            : borderGreyColor),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        height: 30.h,
                                        width: 30.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          border: Border.all(
                                              color:
                                                  controller.currIndex == index
                                                      ? primaryColor
                                                      : borderGreyColor,
                                              width: 7),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          20.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: 121.w,
                                                  child: Text(
                                                    controller
                                                        .filtredServices[index],
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                              81.horizontalSpace,
                                              Text(
                                                "25.00 MAD",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        controller.currIndex ==
                                                                index
                                                            ? primaryColor
                                                            : Colors.black),
                                              ),
                                            ],
                                          ),
                                          10.verticalSpace,
                                          SizedBox(
                                              width: 200.w,
                                              child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur. Integer blandit lacus molestie nunc egestas. Massa id ornare aliquet ac porta."))
                                        ],
                                      )
                                    ],
                                  )),
                            );
                          }),
                    ),
                    29.verticalSpace,
                    SizedBox(
                        width: 300.w,
                        child: PrimaryButton(
                            text: 'next',
                            onpress: () {
                            if(controller.currIndex==null){
                              Get.snackbar("Error", "Please select a service");

                            }else{
                                Get.to(() => CompleteOrderScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: Duration(milliseconds: 500));
                            }
                            }))
                  ],
                ),
              );
            }));
  }
}
