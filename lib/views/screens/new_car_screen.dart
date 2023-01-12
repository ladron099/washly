import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/widgets.dart';

class NewCarScreen extends StatelessWidget {
  const NewCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hasTitle: true, title: "addvechile", subTitle: "addyourvechile"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: 375.w,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  width: 210.w,
                  height: 210.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Boxicons.bx_image, color: primaryColor, size: 100.sp,),
                      10.verticalSpace,
                      Text("uploadveichlephoto", style: TextStyle(color: primaryColor, fontSize: 14.sp, ),).tr()
                    ],
                  ),
                ),
                15.verticalSpace,
                TextFieldPrimary(hint: "name", visible: true, hasIcon: false,),
                15.verticalSpace,
                TextFieldPrimary(hint: "type", visible: true, hasIcon: false,),
                15.verticalSpace,
                TextFieldPrimary(hint: "mark", visible: true, hasIcon: false,),
                15.verticalSpace,
                TextFieldPrimary(hint: "model", visible: true, hasIcon: false,),
                15.verticalSpace,
                TextFieldPrimary(hint: "color", visible: true, hasIcon: false,),
                15.verticalSpace,
                TextFieldPrimary(hint: "matricul", visible: true, hasIcon: false,),
                15.verticalSpace,
                Container(
                  width: 300.w,
                  child: PrimaryButton(text: 'save', onpress: (){}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}