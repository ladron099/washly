import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../controllers/registerController.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) {
              return LoadingScreen(
                loading: controller.loading.value,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 62.h,
                            child: Center(
                              child: Image(
                                  image: AssetImage('assets/images/rlogo.png')),
                            )),
                        15.verticalSpace,
                        Center(
                          child: Text(
                            'Washly',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 83.w),
                          child: Center(
                            child: Text(
                              'createaccount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ).tr(),
                          ),
                        ),
                        30.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldPrimary(
                            controller: controller.firstNameController,
                            visible: false,
                            hint: "firstname",
                            inputIcon: Icon(Boxicons.bx_user),
                          ),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldPrimary(
                            controller: controller.lastNameController,
                            visible: false,
                            hint: "lastname",
                            inputIcon: Icon(Boxicons.bx_user),
                          ),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldPrimary(
                            controller: controller.emailController,
                            visible: false,
                            hint: "email",
                            inputIcon: Icon(Boxicons.bx_envelope),
                          ),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldPrimary(
                            controller: controller.passwordController,
                            visible: true,
                            hint: "password",
                            inputIcon: Icon(Boxicons.bx_lock_alt),
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "additionnalinfo",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ).tr(),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFieldPrimary(
                              controller: controller.cityController,
                              hint: tr('city'),
                              inputIcon: Icon(Boxicons.bx_home),
                              visible: false),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: DropDownMenu(
                              items: controller.dropdownSexeItems,
                              listItem: controller.sexe,
                              function: (value) {
                                controller.gender = value!.value;
                                controller.dropDownMenuChange(value);
                                controller.update();
                              },
                            ),
                          
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: InputDatePicker(
                            dateText: controller.birthday,
                            icon: Boxicons.bx_calendar,
                            function: () => DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                controller.birthdate = date;
                                controller.birthday = DateFormat('dd-MM-yyyy')
                                    .format(date)
                                    .toString();
                                controller.update();
                              },
                              currentTime:
                                  DateTime.now().subtract(Duration(days: 6575)),
                              locale: LocaleType.en,
                            ),
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            "byclickingprivacy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ).tr(),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: PrimaryButton(
                            onpress: () {
                              controller.submit();
                            },
                            text: 'signup',
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ).tr(),
                            5.horizontalSpace,
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                'login',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ).tr(),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
