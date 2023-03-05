import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/constants.dart';

import '../../utils/buttons.dart';
import '../components/widgets.dart';

class ShareWithFriendsScreen extends StatelessWidget {
  const ShareWithFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            hasTitle: true,
            title: "sharewithfriends",
            subTitle: "sharewithfriends"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              30.verticalSpace,
              Image.asset('assets/images/sharewithfriends.png'),
              Text(
                'invitefriends',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ).tr(),
              18.verticalSpace,
              Text(
                'earn',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ).tr(),
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26.r),
                          bottomLeft: Radius.circular(26.r)),
                      border: Border.all(color: primaryColor, width: 1),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '756HH2',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ).tr(),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('sharecode');
                    },
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26.r),
                            bottomRight: Radius.circular(26.r)),
                        border: Border.all(color: primaryColor, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'sharecode',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ).tr(),
                      ),
                    ),
                  ),
                ],
              ),
              18.verticalSpace,
              Container(
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26.r),
                    border: Border.all(color: borderGreyColor, width: 1)),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Text(
                      'howitworks',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ).tr(),
                    20.verticalSpace,
                    Text(
                      'shareyourcode',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ).tr(),
                    15.verticalSpace,
                    Text(
                      'earntwenty',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ).tr(),
                    20.verticalSpace,
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
