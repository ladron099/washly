import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/complete_order_screen.dart';
import 'package:washly/views/screens/enter_address_screen.dart';
import 'package:washly/views/screens/services_screen.dart'; 

void main() async {
  await GetStorage.init();
  await handlerPermission();
  Widget? main;
  await initWidget(main).then((value) {
    main = value;
  },);
  runApp(EasyLocalization(
    supportedLocales: supportedLocales,
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    startLocale: Locale("en"),
    child: ScreenUtilInit(
      designSize: Size(375, 812 ),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Washly',
          theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(),
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: primaryColor,
                ),
            primaryColor: primaryColor,
          ),
          home: EneterAddressScreen(),
        );
      },
    ),
  ));
}
