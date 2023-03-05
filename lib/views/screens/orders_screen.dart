import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/ordersController.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasTitle: true, title: "myorders", subTitle: "hereisallorders"),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GetBuilder<OrdersController>(
                  init: OrdersController(),
                  builder: (controller) {
                    return Column(children: [
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PriceWidget(
                            text: "totalamount",
                            total: 7000,
                          ),
                          PriceWidget(
                            text: "orders",
                            total: 110,
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilterWidget(
                            text: "all",
                            index: 0,
                            selected: controller.currIndex,
                            onPress: () => controller.switchIndex(0),
                          ),
                          FilterWidget(
                            text: "done",
                            index: 1,
                            selected: controller.currIndex,
                            onPress: () => controller.switchIndex(1),
                          ),
                          FilterWidget(
                            text: "pending",
                            index: 2,
                            selected: controller.currIndex,
                            onPress: () => controller.switchIndex(2),
                          ),
                          FilterWidget(
                            text: "canceled",
                            index: 3,
                            selected: controller.currIndex,
                            onPress: () => controller.switchIndex(3),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => OrderHistoryWidget(
                                order: controller.filtredOrders[index],
                              ),
                          separatorBuilder: (context, index) =>
                              10.verticalSpace,
                          itemCount: controller.filtredOrders.length),
                      15.verticalSpace
                    ]);
                  }),
            ),
          )),
    );
  }
}
