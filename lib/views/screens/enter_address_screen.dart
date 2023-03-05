import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/services_screen.dart';

import '../../controllers/enterAdressController.dart';
import '../components/loading_screen.dart';
import '../components/waveLoading.dart';

class EneterAddressScreen extends StatelessWidget {
  const EneterAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<EnterAddressController>(
          init: EnterAddressController(),
          builder: (controller) {
            return Column(
              children: [
                Container(
                    width: 375.w,
                    height: isKeyboard ? 200.h : controller.mapHeight,
                    child: Stack(
                      children: [
                        Container(
                            child: controller.loading.value
                                ? WaveLoadingScreen()
                                : GoogleMap(
                                    mapType: MapType.normal,
                                    myLocationEnabled: true,
                                    initialCameraPosition:
                                        controller.kGooglePlex!,
                                    markers: controller.markers,
                                    myLocationButtonEnabled: false,
                                    zoomControlsEnabled: false,
                                    onMapCreated: (onMapCreated) {
                                      controller.mapController
                                          .complete(onMapCreated);
                                    },
                                  )),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              height: 49.w,
                              width: 49.w,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.22),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(17.r),
                                ),
                              ),
                              child: Icon(
                                Boxicons.bx_left_arrow_alt,
                                color: primaryColor,
                                size: 30.sp,
                              )).paddingOnly(left: 20.w, top: 45.h),
                        ),
                      ],
                    )),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r))),
                        child: controller.isNone == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  20.verticalSpace,
                                  InkWell(
                                    onTap: () {
                                      controller.isNone = false;
                                      controller.isCurrent = true;
                                      controller.isSaved = false;
                                      controller.isNew = false;
                                      controller.addressController.text =
                                          "Meknes Rue 3";
                                      controller.update();
                                    },
                                    child: ListTile(
                                      title: Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Text(
                                          "currentlocation",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ).tr(),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      subtitle: Text(
                                        "choosecurrentlocation",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ).tr(),
                                      leading: Container(
                                          height: 49.h,
                                          width: 49.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17.r),
                                              color: Colors.white),
                                          child: Icon(
                                              Boxicons.bx_current_location,
                                              color: primaryColor)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isNone = false;
                                      controller.isCurrent = false;
                                      controller.isSaved = true;
                                      controller.isNew = false;
                                      controller.mapHeight = 200.h;
                                      controller.update();
                                    },
                                    child: ListTile(
                                      title: Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Text(
                                          "savedlocations",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ).tr(),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      subtitle: Text(
                                        "choosepreviouslocation",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ).tr(),
                                      leading: Container(
                                          height: 49.h,
                                          width: 49.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17.r),
                                              color: Colors.white),
                                          child: Icon(Boxicons.bx_save,
                                              color: primaryColor)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isNone = false;
                                      controller.isCurrent = false;
                                      controller.isSaved = false;
                                      controller.isNew = true;
                                      controller.update();
                                    },
                                    child: ListTile(
                                      title: Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Text(
                                          "newlocation",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ).tr(),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.h),
                                      subtitle: Text(
                                        "addnewlocation",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ).tr(),
                                      leading: Container(
                                          height: 49.h,
                                          width: 49.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17.r),
                                              color: Colors.white),
                                          child: Icon(Boxicons.bx_add_to_queue,
                                              color: primaryColor)),
                                    ),
                                  ),
                                ],
                              )
                            : controller.isNew == true
                                ? Container(
                                    width: 375.w,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          20.verticalSpace,
                                          Text(
                                            'completeaddress',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ).tr(),
                                          28.verticalSpace,
                                          Text(
                                            'address',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ).tr(),
                                          10.verticalSpace,
                                          TextFieldPrimary(
                                            controller:
                                                controller.addressController,
                                            hint: 'address',
                                            inputIcon: Icon(
                                                Boxicons.bx_current_location),
                                            visible: false,
                                          ),
                                          10.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 150.w,
                                                child: PrimaryButton(
                                                  color: Colors.white,
                                                  text: "back",
                                                  onpress: (() {
                                                    controller.reset();
                                                  }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150.w,
                                                child: PrimaryButton(
                                                  color: Colors.white,
                                                  text: "next",
                                                  onpress: (() {
                                                    Get.to(
                                                        () => ServicesScreen(),
                                                        transition: Transition
                                                            .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 500));
                                                  }),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : controller.isCurrent == true
                                    ? Container(
                                        width: 375.w,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              20.verticalSpace,
                                              Text(
                                                'completeaddress',
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ).tr(),
                                              28.verticalSpace,
                                              Text(
                                                'address',
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ).tr(),
                                              10.verticalSpace,
                                              TextFieldPrimary(
                                                controller: controller
                                                    .addressController,
                                                hint: 'address',
                                                inputIcon: Icon(Boxicons
                                                    .bx_current_location),
                                                visible: false,
                                              ),
                                              10.verticalSpace,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: 150.w,
                                                    child: PrimaryButton(
                                                      color: Colors.white,
                                                      text: "back",
                                                      onpress: (() {
                                                        controller.reset();
                                                      }),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 150.w,
                                                    child: PrimaryButton(
                                                      color: Colors.white,
                                                      text: "next",
                                                      onpress: (() {
                                                        Get.to(
                                                          () =>
                                                              ServicesScreen(),
                                                          transition: Transition
                                                              .rightToLeft,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : controller.isSaved == true
                                        ? Container(
                                            width: 375.w,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  20.verticalSpace,
                                                  Text(
                                                    'savedaddress',
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ).tr(),
                                                  28.verticalSpace,
                                                  Text(
                                                    'addresses',
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ).tr(),
                                                  10.verticalSpace,
                                                  SizedBox(
                                                    height: 390.h,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 15,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            controller
                                                                    .choosenIndex =
                                                                index;
                                                            controller.update();
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            height: 55.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: index ==
                                                                      controller
                                                                          .choosenIndex
                                                                  ? Colors.green
                                                                      .withOpacity(
                                                                          0.6)
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(Boxicons
                                                                      .bx_current_location),
                                                                  10.horizontalSpace,
                                                                  Text(
                                                                      "Home (Avenue des far , rue 12 agadir)"),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  60.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 150.w,
                                                        child: PrimaryButton(
                                                          color: Colors.white,
                                                          text: "back",
                                                          onpress: (() {
                                                            controller.reset();
                                                          }),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 150.w,
                                                        child: PrimaryButton(
                                                          color: Colors.white,
                                                          text: "next",
                                                          onpress: (() {
                                                            controller.isNone =
                                                                false;
                                                            controller
                                                                    .isCurrent =
                                                                true;
                                                            controller.isSaved =
                                                                false;
                                                            controller.isNew =
                                                                false;
                                                            controller
                                                                    .addressController
                                                                    .text =
                                                                "Meknes Rue 3";
                                                            controller
                                                                    .mapHeight =
                                                                controller
                                                                    .ordianry;
                                                            controller.update();
                                                          }),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container()))
              ],
            );
          }),
    );
  }
}
