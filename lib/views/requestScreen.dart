import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/components/buttons.dart';
import 'package:washly/components/vars.dart';

import 'loginScreen.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
                child:
                    const Image(image: AssetImage('assets/images/rlogo.png')),
              )),
          41.verticalSpace,
          Container(
              child: Center(
            child:
                const Image(image: AssetImage('assets/images/waitingback.png')),
          )),
          38.verticalSpace,
          Center(
            child: Text(
              'Request Sent successfully',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                 color: secondary,
              ),
            ),
          ),
          31.verticalSpace,
          Padding(
            padding:   EdgeInsets.symmetric(horizontal:45.w),
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
