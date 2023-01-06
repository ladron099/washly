import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/constants.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 66.h,
              child: Center(
                child: Image(image: AssetImage('assets/images/rlogo.png')),
              )),
          41.verticalSpace,
          Center(
            child: Image(image: AssetImage('assets/images/waitingback.png')),
          ),
          38.verticalSpace,
          Center(
            child: Text(
              'Request Sent successfully',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
          ),
          31.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Text(
              'Your request has been sent successfully, we will verify your request in 30 days maximum.',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          23.verticalSpace,
        ],
      ),
    );
  }
}
