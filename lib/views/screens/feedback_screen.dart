import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/home_screen.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: CustomAppBar(
          hasTitle: true, title: "feedback", subTitle: "rateourservice"),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            40.verticalSpace,
            Text(
              "ratetext",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ).tr(),
            17.verticalSpace,
            Container(
              height: 106.h,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12.r)),
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        "assets/images/welcomimagex4.png",
                        width: 90.w,
                      )),
                  20.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saada carwash",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "ID : A81219JJ191291",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            48.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Boxicons.bx_sad,
                    color: redColor,
                  ),
                  iconSize: 40.sp,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Boxicons.bx_smile,
                    color: Colors.amber,
                  ),
                  iconSize: 40.sp,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Boxicons.bx_happy,
                    color: Colors.green[400],
                  ),
                  iconSize: 40.sp,
                ),
              ],
            ),
            30.verticalSpace,
            TextField(
              maxLines: 9,
              decoration: InputDecoration(
                  hintText: "Tell us more",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          BorderSide(width: 1.sp, color: Colors.grey[400]!)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:
                          BorderSide(width: 1.sp, color: Colors.grey[400]!))),
            ),
            120.verticalSpace,
            Container(
                width: 300.w,
                child: PrimaryButton(
                    text: "done",
                    onpress: () {
                      Get.offAll(() => HomeScreen(),
                          transition: Transition.rightToLeft);
                    }))
          ],
        ),
      )),
    );
  }
}
