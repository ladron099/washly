import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:washly/utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  VoidCallback onpress;
  Color? color;
  Icon? icon;
  Size? size;
  bool reverse;
  PrimaryButton(
      {required this.text,
      required this.onpress,
      this.color,
      this.icon,
      this.size,
      this.reverse = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: !reverse?  color : Colors.transparent,
        minimumSize: size ?? Size(250.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.r),
          side:  BorderSide(color:reverse ? color ?? primaryColor : Colors.transparent) 
        ),
      ),
      onPressed: (){
        onpress();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            icon!
          else
            const SizedBox(
              height: 0,
              width: 0,
            ),
          if (icon != null) 20.horizontalSpace,
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.sp,
              color: reverse ? color : Colors.white,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
