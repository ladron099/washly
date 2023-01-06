import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/drawer.dart';
import 'package:washly/views/components/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasDrawer: true,
          context: context,
          hasActions: true,
          onPres: () {
            Scaffold.of(context).openDrawer();
          }),
      drawerEnableOpenDragGesture: false,
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          width: 375.w,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: HomeWidget(
                  widget: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OrderWidget(
                            distance: 7,
                            name: "Abdessamad Berahhou",
                            imagePath: "assets/images/profile.png",
                            orderType: "Standard",
                          ),
                      separatorBuilder: (context, index) => 15.verticalSpace,
                      itemCount: 5)),
            ),
          ),
        ),
      ),
    );
  }
}
