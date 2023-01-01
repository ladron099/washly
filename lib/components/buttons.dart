import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:washly/components/vars.dart';

class PrimaryButton extends StatefulWidget {
  String text;
  Callback onpress;
  Color? color;
  Icon? icon;


  PrimaryButton(
      {required this.text,
      required this.onpress,
       this.color,
       this.icon,
      Key? key})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: widget.color,
        minimumSize: Size(320.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.r),
        ),
      ),
      onPressed: widget.onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       if(widget.icon!=null)
          widget.icon!
          else
          const SizedBox(
            height: 0,
            width: 0,
          
          ),
           if(widget.icon!=null)
          20.horizontalSpace,
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.sp,
              color: Colors.white,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
