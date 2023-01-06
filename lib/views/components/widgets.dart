import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart' as u;
import 'package:washly/utils/models/list_item.dart';
import 'package:washly/utils/models/order.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/order_details_screen.dart';
import 'package:washly/views/screens/order_history_detail_screen.dart';

class TextFieldPrimary extends StatelessWidget {
  String hint;
  Icon inputIcon;
  bool visible;
  TextFieldPrimary({
    required this.hint,
    required this.inputIcon,
    required this.visible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TextField(
        obscureText: visible,
        decoration: InputDecoration(
          hintText: u.tr(hint),
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
          prefixIcon: inputIcon,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: borderGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}

PreferredSize CustomAppBar(
    {bool hasDrawer = false,
    context,
    onPres,
    hasActions = false,
    hasTitle = false,
    title,
    subTitle}) {
  return PreferredSize(
      preferredSize: Size(428.w, 60.h),
      child: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: hasTitle
            ? ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  title,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ).tr(),
                subtitle: Text(
                  subTitle,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ).tr(),
              )
            : null,
        elevation: 0,
        actions: [
          if (hasActions)
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  "assets/images/rlogo.png",
                  width: 52.w,
                ))
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: hasDrawer
                ? Icon(
                    Boxicons.bxs_grid_alt,
                    size: 35.w,
                    color: primaryColor,
                  )
                : Icon(
                    Boxicons.bx_left_arrow_alt,
                    size: 26.w,
                    color: primaryColor,
                  ),
            onPressed: hasDrawer
                ? () {
                    Scaffold.of(context).openDrawer();
                  }
                : () {
                    Get.back();
                  },
          );
        }),
      ));
}

class HomeWidget extends StatelessWidget {
  Widget widget;
  HomeWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text("goodmorning",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600))
            .tr(),
        10.verticalSpace,
        Text(
          "Abdessamad Berahhou",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        30.verticalSpace,
        widget,
        25.verticalSpace
      ],
    );
  }
}

class OrderWidget extends StatelessWidget {
  String? name;
  String? imagePath;
  String? orderType;
  double? distance;
  OrderWidget({
    Key? key,
    this.name,
    this.imagePath,
    this.orderType,
    this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: primaryColor, width: 2.w)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            15.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text("${distance.toString()} Km"),
                    120.horizontalSpace,
                    Text(orderType!)
                  ],
                ),
                15.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 235.w,
                  alignment: Alignment.centerRight,
                  child: PrimaryButton(
                    text: "vieworder",
                    onpress: () {
                      goTo(OrderDetailScreen());
                    },
                    size: Size(150, 40),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  String? text;
  VoidCallback? onPress;
  IconData? icon;
  ProfileWidget({Key? key, this.text, this.onPress, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 50.h,
        width: 350.w,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(12.r)),
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Icon(
                icon!,
                color: primaryColor,
                size: 20.w,
              )),
          Container(
            width: 200.w,
            child: Text(
              text!,
              style: TextStyle(color: primaryColor, fontSize: 16.sp),
            ).tr(),
          )
        ]),
      ),
    );
  }
}

class HelpWidget extends StatelessWidget {
  String? text;
  VoidCallback? onPress;
  IconData? icon;
  HelpWidget({Key? key, this.text, this.onPress, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 50.h,
        width: 350.w,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2.w),
            color: primaryColor,
            borderRadius: BorderRadius.circular(12.r)),
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Icon(
                icon!,
                color: Colors.white,
                size: 20.w,
              )),
          Container(
            width: 150.w,
            child: Text(
              text!,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          )
        ]),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  String? text;
  double? total;
  Color? customColor;
  PriceWidget({
    this.text,
    this.total,
    Key? key,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: customColor ?? primaryColor),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ).tr(),
          10.verticalSpace,
          Text("${total!.toStringAsFixed(2)} MAD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ))
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  String? text;
  int? selected;
  int? index;
  VoidCallback? onPress;
  FilterWidget({Key? key, this.selected, this.index, this.text, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        width: 80.w,
        height: 33.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected == index ? primaryColor : Colors.transparent,
            border: selected != index ? Border.all(color: primaryColor) : null,
            borderRadius: BorderRadius.circular(12.r)),
        child: Text(
          text!,
          style: TextStyle(
              color: selected == index ? Colors.white : primaryColor,
              fontSize: 16.sp),
        ).tr(),
      ),
    );
  }
}

class OrderHistoryWidget extends StatelessWidget {
  Order? order;
  OrderHistoryWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => OrderHistoryDetailScreen(
                  order: order,
                ),
            transition: Transition.rightToLeft);
        print("test");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        width: 375.w,
        height: 109.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: order!.orderStatus == 1
                    ? secondaryColor
                    : order!.orderStatus == 2
                        ? Color.fromARGB(255, 255, 194, 10)
                        : redColor,
                width: 2.sp),
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                order!.orderCar!.carPicture!,
                width: 89.w,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 210.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order!.orderCar!.carName!,
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              order!.orderStatus == 1
                                  ? Boxicons.bx_check_circle
                                  : order!.orderStatus == 2
                                      ? Boxicons.bx_time
                                      : Boxicons.bx_x_circle,
                              color: order!.orderStatus == 1
                                  ? secondaryColor
                                  : order!.orderStatus == 2
                                      ? Color.fromARGB(255, 255, 194, 10)
                                      : redColor,
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                    width: 210.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              order!.orderCar!.carMatricule!,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                    width: 210.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "STANDARD",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Text("58.00 MAD",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400)),
                                9.horizontalSpace,
                                if (order!.orderStatus == 1)
                                  Icon(
                                    order!.orderPaymentMethod == 1
                                        ? Boxicons.bx_credit_card
                                        : Boxicons.bx_money,
                                    color: order!.orderStatus == 1
                                        ? secondaryColor
                                        : order!.orderStatus == 2
                                            ? Color.fromARGB(255, 255, 194, 10)
                                            : redColor,
                                  )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  Order? order;
  CarWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
      width: 375.w,
      height: 86.h,
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 2.sp),
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 89.w,
              height: 63.h,
              child: Image.asset(
                order!.orderCar!.carPicture!,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 210.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order!.orderCar!.carName!,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: primaryColor,
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
                            order!.orderCar!.carMatricule!,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}


class DropDownMenu extends StatefulWidget {
  List<DropdownMenuItem<ListItem>>? items;
  ListItem? listItem;
  final Function(ListItem?)? function;

  DropDownMenu(
      {required this.items,
      required this.listItem,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}
class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderGreyColor, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              height: 65.h,
              width: 300.w,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ListItem>(
                  value: widget.listItem,
                  items: widget.items,
                  style: TextStyle(fontSize: 16,color: borderGreyColor),
                  iconSize: 20,
                  icon: const Icon(
                    Boxicons.bx_chevron_down,
                    color: Colors.black,
                  ),
                  iconEnabledColor: Colors.grey[800],
                  isExpanded: true,
                  onChanged: widget.function,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class InputDatePicker extends StatefulWidget {
  String dateText;
  IconData icon;
  VoidCallback function;

  InputDatePicker(
      {required this.dateText,
      required this.icon,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  State<InputDatePicker> createState() => _InputDatePickerState();
}

class _InputDatePickerState extends State<InputDatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderGreyColor, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.grey,
              ),
              10.horizontalSpace,
              Text(
                widget.dateText,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}