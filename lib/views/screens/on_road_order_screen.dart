import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/controllers/startCommandController.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/views/screens/searching_scrubber_screen.dart';
import 'package:washly/views/screens/start_command_screen.dart';

class OnRoadOrderScreen extends StatelessWidget {
  const OnRoadOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StartCommandController>(
          init: StartCommandController(),
          builder: (controller) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 650.h,
                      child: controller.loading.value
                          ? GoogleMap(
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              initialCameraPosition: controller.kGooglePlex!,
                              markers: controller.markers,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                              onMapCreated: (onMapCreated) {
                                controller.mapController.complete(onMapCreated);
                              },
                            )
                          : Center(
                              child: Text("loading..."),
                            ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => exitReasonDialog(context),
                  // onTap: () => Get.to(()=>StartCommandScreen(), transition: Transition.rightToLeft),
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
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        "Abdessamad Berahhou",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                    subtitle: Text(
                      "ID: A895965656",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    leading: Image.asset("assets/images/profile.png"),
                    trailing: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: secondaryColor),
                        width: 45.w,
                        height: 45.w,
                        child: IconButton(
                          onPressed: () {
                            Get.to(()=>StartCommandScreen(), transition: Transition.rightToLeft);
                          },
                          icon: Icon(Boxicons.bx_phone_call),
                          color: Colors.white,
                        )),
                  ),
                ))
              ],
            );
          }),
    );
  }
}
