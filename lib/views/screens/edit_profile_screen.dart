import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart'; 

import 'package:washly/controllers/EditInfoController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../utils/services.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            hasTitle: true,
            title: 'modifyinfo'.tr(),
            subTitle: "yourinfo".tr()),
        body: Container(
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    child: GetBuilder<EditInfoController>(
                      init: EditInfoController(),
                      builder: (controller) {
                        return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        30.verticalSpace,
                        Text(
                          "maininformations",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ).tr(),
                        20.verticalSpace,
                        TextFieldPrimary(
                            hint: 'firstname'.tr(),
                            inputIcon: Icon(Boxicons.bx_user),
                            visible: false),
                        20.verticalSpace,
                        TextFieldPrimary(
                            hint: 'lastname'.tr(),
                            inputIcon: Icon(Boxicons.bx_user),
                            visible: false),
                        20.verticalSpace,
                        TextFieldPrimary(
                            hint: 'email'.tr(),
                            inputIcon: Icon(Boxicons.bx_envelope),
                            visible: false),
                        30.verticalSpace,
                          Text(
                          "additionnalinfo",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),

                          ).tr(),
                             20.verticalSpace,
                        TextFieldPrimary(
                            hint: 'city'.tr(),
                            inputIcon: Icon(Boxicons.bx_home),
                            visible: false),
                             20.verticalSpace,
                        TextFieldPrimary(
                            hint: 'address'.tr(),
                            inputIcon: Icon(Boxicons.bx_home),
                            visible: false),
                            20.verticalSpace,
                               GetBuilder<EditInfoController>(
                              init: EditInfoController(),
                              builder: (value) => DropDownMenu(
                                items: controller.dropdownSexeItems,
                                listItem: controller.sexe,
                                function: (value) {
                                  controller.dropDownMenuChange(value);
                                  controller.update();
                                },
                              ),
                            ),
                            20.verticalSpace,
                              GetBuilder<EditInfoController>(
                          init: EditInfoController(),
                          builder: (value) => InputDatePicker(
                            dateText: controller.birthday,
                            icon: Boxicons.bx_calendar,
                            function: () => DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,  
                              onConfirm: (date) {
                                controller.birthday = DateFormat('dd-MM-yyyy')
                                    .format(date)
                                    .toString();
                                controller.update();
                              },
                              currentTime: DateTime.now().subtract(Duration(days:6575)),
                              locale: LocaleType.en,

                                  
                                 
                            ),
                          ),
                        ),

                      20.verticalSpace,
                      Center(
                        child: Container(
                          height: 50.h,
                          width: 300.w,
                          
                          child: PrimaryButton(text: "save".tr(), onpress: (){})),
                      )
                          
                  ],
                );
                      }
                    )))));
  }
}