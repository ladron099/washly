import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/screens/on_road_order_screen.dart';
import 'package:washly/views/screens/start_command_screen.dart';

class SearchingScrubberScreen extends StatelessWidget {
  const SearchingScrubberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        child: Column(children: [
          57.verticalSpace,
          Image.asset(
            "assets/images/rlogo.png",
            width: 96.w,
          ),
          46.verticalSpace,
          Text(
            "lookingforcarwash",
            style: TextStyle(
                color: primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ).tr(),
          10.verticalSpace,
          Image.asset(
            "assets/images/welcomimagex4.png",
            width: 250.w,
          ),
          40.verticalSpace,
          InkWell(
            onTap: () => Get.to(() => OnRoadOrderScreen(),
                transition:
                    Transition.rightToLeft), //exitReasonDialog(context),
            child: Container(
              alignment: Alignment.center,
              height: 50.h,
              color: redColor,
              width: 375.w,
              child: Text(
                "cancel",
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ).tr(),
            ),
          ),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  color: primaryColor,
                  child: Container(
                    width: 375.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Text(
                          "yourorder",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ).tr(),
                        30.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Boxicons.bx_current_location,
                              color: Colors.white,
                            ),
                            7.horizontalSpace,
                            Text(
                              "address",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ).tr()
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            30.horizontalSpace,
                            Text(
                              "Home  (Ibno khaldon rue de fes)",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        30.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Boxicons.bx_dollar,
                              color: Colors.white,
                            ),
                            7.horizontalSpace,
                            Text(
                              "paymentdetails",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ).tr()
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            30.horizontalSpace,
                            Text(
                              "paymentmethod",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ).tr(),
                            150.horizontalSpace,
                            Text(
                              "Cash",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            30.horizontalSpace,
                            Text(
                              "total",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ).tr(),
                            190.horizontalSpace,
                            Text(
                              "53.00 MAD",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ))),
        ]),
      ),
    );
  }
}
