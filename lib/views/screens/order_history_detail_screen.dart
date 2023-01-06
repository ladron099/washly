import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/models/order.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart' as u;

class OrderHistoryDetailScreen extends StatelessWidget {
  OrderHistoryDetailScreen({super.key, this.order});
  Order? order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          hasTitle: true,
          title: "detailsoforder",
          subTitle: "${u.tr("id")}: AU80622945"),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 52.h,
                width: 375.w,
                color: order!.orderStatus == 1
                    ? secondaryColor
                    : order!.orderStatus == 2
                        ? Color.fromARGB(255, 255, 194, 10)
                        : redColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      order!.orderStatus == 1
                          ? Boxicons.bx_check_circle
                          : order!.orderStatus == 2
                              ? Boxicons.bx_time
                              : Boxicons.bx_x_circle,
                      color: Colors.white,
                    ),
                    10.horizontalSpace,
                    Text(
                      order!.orderStatus == 1
                          ? "ordersucceded"
                          : order!.orderStatus == 2
                              ? "orderpending"
                              : "ordercanceled",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ).tr(),
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
                width: 340.w,
                height: 80.h,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 2.sp),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        order!.orderCar!.carPicture!,
                        width: 75.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          order!.orderCar!.carName!,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Container(
                            width: 230.w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      order!.orderCar!.carMatricule!,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
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
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        18.verticalSpace,
                        Text(
                          "Rue de far 12, Casablanca, Morocco",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
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
                          "service",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        18.verticalSpace,
                        Text(
                          "STANDARD",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
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
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        18.verticalSpace,
                        Container(
                          width: 290.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "paymentmethod",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ).tr(),
                              Text(
                                "Cash",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        Container(
                          width: 290.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "subtotal",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ).tr(),
                              Text(
                                "70.00 MAD",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        Container(
                          width: 290.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "discount",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ).tr(),
                              Text(
                                "-17.00 MAD",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        Container(
                          width: 290.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "total",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ).tr(),
                              Text(
                                "53.00 MAD",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                      ],
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
