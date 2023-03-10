import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/controllers/profilePictureController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/waveLoading.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/home_screen.dart';

import '../../utils/constants.dart';

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: GetBuilder<ProfilePictureController>(
          init: ProfilePictureController(),
          builder: (controller) {
            return controller.loading.value
                ? WaveLoadingScreen()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        82.verticalSpace,
                        Image(
                          image: AssetImage('assets/images/rlogo.png'),
                          height: 66.h,
                        ),
                        40.verticalSpace,
                        Text(
                          'Washly',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        34.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 83.w),
                          child: Center(
                            child: Text(
                              'Upload a picture of yours',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ).tr(),
                          ),
                        ),
                        15.verticalSpace,
                        InkWell(
                          onTap: () {
                            controller.selectImage();
                          },
                          child: Container(
                            height: 160.h,
                            width: 160.h,
                            child: controller.file == null
                                ? Icon(
                                    FontAwesomeIcons.cloudArrowUp,
                                    color: dark.withOpacity(0.4),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.file(
                                      controller.image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35.w, vertical: 20.h),
                          child: Text(
                            "Upload a picture of yours",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        146.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.w),
                          child: PrimaryButton(
                            onpress: () async {
                              // await GetStorage().write('isLoggedIn', true);
                              // Get.offAll(() => HomeScreen(),
                              //     transition: Transition.rightToLeft);
                              controller.uploadImage();
                            },
                            text: 'done',
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  );
          }),
    );
  }
}
