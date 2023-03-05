import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/static_orders.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/edit_car_screen.dart';
import 'package:washly/views/screens/new_car_screen.dart';

class ChooseCarScreen extends StatelessWidget {
  const ChooseCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasTitle: true,
          title: "chooseaveichle",
          subTitle: "chooseyourveichle"),
      body: Column(
        children: [
          10.verticalSpace,
          Container(
            height: 80.h,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[400]!),
                    bottom: BorderSide(width: 1, color: Colors.grey[400]!))),
            child: Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    onPressed: (value) {
                      Get.to(() => EditCarScreen(),
                          transition: Transition.rightToLeft);
                    },
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    icon: Boxicons.bx_edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (value) {
                      deletCarDialog(context);
                    },
                    backgroundColor: redColor,
                    foregroundColor: Colors.white,
                    icon: Boxicons.bx_trash,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      width: 75.w,
                      height: 63.h,
                      child: Image.asset(
                        orders[0].orderCar!.carPicture!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 210.w,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orders[0].orderCar!.carName!,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          )),
                      14.verticalSpace,
                      Container(
                          width: 210.w,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    orders[0].orderCar!.carMatricule!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
          width: 60.w,
          child: FittedBox(
              child: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => NewCarScreen(),
                        transition: Transition.rightToLeft);
                  },
                  elevation: 0,
                  child: Icon(
                    Boxicons.bx_plus,
                    size: 25.sp,
                  )))),
    );
  }
}
