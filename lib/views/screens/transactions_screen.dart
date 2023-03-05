import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/transactionsController.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasTitle: true,
          title: "transactions",
          subTitle: "hereisalltransactions"),
      body: GetBuilder<TransactionsController>(
          init: TransactionsController(),
          builder: (controller) => Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceWidget(
                          text: "totalamount",
                          total: 7000,
                        ),
                        PriceWidget(
                          text: "paytowashly",
                          total: 110,
                          customColor: redColor,
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
                          text: "in",
                          index: 1,
                          selected: controller.currIndex,
                          onPress: () => controller.switchIndex(1),
                        ),
                        FilterWidget(
                          text: "out",
                          index: 2,
                          selected: controller.currIndex,
                          onPress: () => controller.switchIndex(2),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(),
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: controller.filtredOrders.length),
                    15.verticalSpace
                  ],
                ),
              )),
    );
  }
}
