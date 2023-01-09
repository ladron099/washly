import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washly/utils/models/order.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/utils/static_orders.dart';
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
                  widget: Column(
                children: [
                  InputDecorator(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<Order>(
                      onChanged: (newValue) {},
                      value: orders[0],
                      items: orders.map<DropdownMenuItem<Order>>((Order value) {
                        return DropdownMenuItem<Order>(
                          value: value,
                          child: Container(
                              width: 270.w,
                              height: 50.h,
                              margin: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                children: [
                                  Image.asset(value.orderCar!.carPicture!),
                                  15.horizontalSpace,
                                  Text(value.orderCar!.carName!)
                              ],)),
                        );
                      }).toList(),
                    )),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
