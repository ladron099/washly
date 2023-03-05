import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:washly/controllers/changePasswordController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (controller) {
          return controller.loading.value
              ? LoadingScreen(
                  loading: controller.loading.value, child: Container())
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: CustomAppBar(
                      hasTitle: true,
                      title: 'changepassword'.tr(),
                      subTitle: "changepassword".tr()),
                  body: Container(
                      width: 375.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.verticalSpace,
                              TextFieldPrimary(
                                  controller: controller.oldPasswordController,
                                  hint: 'currentpassword'.tr(),
                                  inputIcon: Icon(Boxicons.bx_lock_alt),
                                  visible: true),
                              20.verticalSpace,
                              TextFieldPrimary(
                                  controller: controller.newPasswordController,
                                  hint: 'newpassword'.tr(),
                                  inputIcon: Icon(Boxicons.bx_lock_alt),
                                  visible: true),
                              20.verticalSpace,
                              TextFieldPrimary(
                                  controller:
                                      controller.confirmPasswordController,
                                  hint: 'confirmpassword'.tr(),
                                  inputIcon: Icon(Boxicons.bx_lock_alt),
                                  visible: true),
                              55.verticalSpace,
                              Container(
                                  height: 50.h,
                                  width: 320.w,
                                  child: PrimaryButton(
                                      text: "save".tr(),
                                      onpress: () {
                                        controller.changePassword();
                                      }))
                            ],
                          ))));
        });
  }
}
