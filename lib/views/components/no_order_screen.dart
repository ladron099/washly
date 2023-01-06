import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/constants.dart';

Widget NoOrders() => Column(children: [
              30.verticalSpace,
              Image.asset("assets/images/welcomimagex4.png"),
              35.verticalSpace,
              Center(
                  child: Text(
                "noorder",
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ).tr()),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "noordertext",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: borderGreyColor),
                  textAlign: TextAlign.center,
                ).tr(),
              )
            ]);