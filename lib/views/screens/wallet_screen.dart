import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/transactionsController.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/utils/static_transactions.dart';
import 'package:washly/views/components/widgets.dart';

import '../../controllers/walletController.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          hasTitle: true,
          title: "mywallet",
          subTitle: "hereisyourwallet"),
      body: GetBuilder<WalletController>(
          init: WalletController(),
          builder: (controller) => Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    20.verticalSpace,
                     Container(
      width: 340.w,
      height: 140.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color:  primaryColor),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5940.00 MAD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ).tr(),
              25.verticalSpace,
              Text(
                'totalbalance', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).tr(),
            ],
          ),
          10.verticalSpace,
         Container(
          width:70.w ,
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Icon(
            Boxicons.bx_wallet,
            color: primaryColor,
            size: 30.sp,
          ),
         )
        ],
      ),
    ),

                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterWidget(
                          text: "all",
                          index: 0,
                          selected: controller.currIndex,
                          hasSize: true,
                         width: 100.w,
                          onPress: () => controller.switchIndex(0),
                        ),
                        FilterWidget(
                          text: "in",
                          index: 1,
                          hasSize: true,
                         width: 100.w,
                          selected: controller.currIndex,
                          onPress: () => controller.switchIndex(1),
                        ),
                        FilterWidget(
                          text: "out",
                          index: 2,
                          hasSize: true,
                         width: 100.w,
                          selected: controller.currIndex,
                          onPress: () => controller.switchIndex(2),
                        ),
                      ],
                    ),   
                    15.verticalSpace,
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                            itemBuilder: (context, index) => ListTile(
                              contentPadding: EdgeInsets.zero,
                                  title: Text(
                                          controller.filtredTransactions[index].transactionType == 0
                                              ? "washlytoyou"
                                              : "youtowashly")
                                      .tr(),
                                  subtitle: Text(
                                      controller.filtredTransactions[index].transactionDatetime!),
                                  leading: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            controller.filtredTransactions[index].transactionType == 0
                                                ? secondaryColor
                                                : redColor,
                                        borderRadius: BorderRadius.circular(50)),
                                    width: 47.w,
                                    height: 47.w,
                                    child: Icon(Boxicons.bx_transfer, color: Colors.white,),
                                  ),
                                  trailing: Text("${controller.filtredTransactions[index].transactionType == 0? " + "+controller.filtredTransactions[index].transactionPrice.toString():" - "+controller.filtredTransactions[index].transactionPrice.toString()} MAD", style: TextStyle(color: controller.filtredTransactions[index].transactionType == 0
                                                ? secondaryColor
                                                : redColor , fontSize: 15.sp )),
                                ),
                            separatorBuilder: (context, index) => 15.verticalSpace,
                            itemCount: controller.filtredTransactions.length),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
