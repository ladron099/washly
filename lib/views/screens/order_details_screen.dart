import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as u;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/controllers/orderDetailsController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/start_order_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          hasTitle: true,
          title: "detailsoforder",
          subTitle: "${u.tr("orderid")}:UZJ8865"),
      body: GetBuilder<OrderDetailsController>(
          init: OrderDetailsController(),
          builder: (controller) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    22.verticalSpace,
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          child: SizedBox(
                              width: 1.sw,
                              height: 90.h,
                              child: controller.loading.value
                                  ? GoogleMap(
                                      mapType: MapType.normal,
                                      mapToolbarEnabled: false,
                                      rotateGesturesEnabled: false,
                                      scrollGesturesEnabled: false,
                                      zoomGesturesEnabled: false,
                                      tiltGesturesEnabled: false,
                                      myLocationEnabled: true,
                                      initialCameraPosition:
                                          controller.kGooglePlex!,
                                      markers: controller.markers,
                                      compassEnabled: false,
                                      myLocationButtonEnabled: false,
                                      zoomControlsEnabled: false,
                                      onMapCreated: (onMapCreated) {
                                        controller.mapController
                                            .complete(onMapCreated);
                                      },
                                    )
                                  : Center(
                                      child: Text("loading..."),
                                    )),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        width: 1.sw,
                        height: 40.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: primaryColor,
                            minimumSize: Size(320.w, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r)),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "openmap",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ).tr(),
                        ),
                      ),
                    ),
                    20.verticalSpace,
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
                            Boxicons.bx_gift,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "service",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              18.verticalSpace,
                              Text(
                                "Standard",
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
                    21.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_dollar,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          SizedBox(
                            width: 280.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "payment",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                18.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "paymentmethod",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "cash",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "subtotal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "70.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "fees",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "5.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "discount",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "0.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "total",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "75.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                26.verticalSpace,
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 130.w,
                                          height: 40.h,
                                          child: PrimaryButton(
                                              text: "accept",
                                              color: secondaryColor,
                                              onpress: () {
                                                Get.to(()=> StartOrderScreen(), transition: Transition.rightToLeft);
                                              })),
                                      SizedBox(
                                          width: 130.w,
                                          height: 40.h,
                                          child: PrimaryButton(
                                            reverse: true,
                                              text: "refuse",
                                              color: redColor,
                                              onpress: () {})),
                                    ]),
                                26.verticalSpace,
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
