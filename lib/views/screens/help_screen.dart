import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/views/components/widgets.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasTitle: true, title: "helpcenter", subTitle: "howcawnwehelpyou"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          60.verticalSpace,
          Image.asset(
            "assets/images/help.png",
            width: 314.w,
          ),
          40.verticalSpace,
          HelpWidget(
            text: "contact@washly.com",
            icon: Boxicons.bx_envelope,
            onPress: () {},
          ),
          25.verticalSpace,
          HelpWidget(
            text: "(+212) 684 990 001",
            icon: Boxicons.bx_phone_call,
            onPress: () {},
          ),
          25.verticalSpace,
          HelpWidget(
            text: "washly.com",
            icon: Boxicons.bx_link_alt,
            onPress: () {},
          ),
          25.verticalSpace,
        ]),
      ),
    );
  }
}
