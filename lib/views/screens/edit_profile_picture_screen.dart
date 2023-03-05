import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:washly/controllers/editProfilePictureController.dart';

import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/waveLoading.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utils/services.dart';

class ChangeProfilePictureScreen extends StatelessWidget {
  const ChangeProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfilePictureController>(
        init: EditProfilePictureController(),
        builder: (controller) {
          return controller.loading.value
              ? WaveLoadingScreen()
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: CustomAppBar(
                      hasTitle: true,
                      title: 'profilechange'.tr(),
                      subTitle: "profilechange".tr()),
                  body: Container(
                      width: 375.w,
                      height: 812.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              62.verticalSpace,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(95.w),
                                child: controller.file != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: Image.file(
                                          width: 190.w,
                                          height: 190.w,
                                          controller.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            controller.userBase!.client_picture,
                                        fit: BoxFit.cover,
                                        width: 190.w,
                                        height: 190.w,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/images/default.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                              31.verticalSpace,
                              InkWell(
                                onTap: () {
                                  controller.selectImage();
                                },
                                child: Text(
                                  "uploadyourself",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor),
                                ).tr(),
                              ),
                              300.verticalSpace,
                              PrimaryButton(
                                  text: 'save'.tr(),
                                  onpress: () {
                                    controller.uploadImage();
                                  })
                            ],
                          )))));
        });
  }
}
