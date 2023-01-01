import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:washly/views/welcomeScreen.dart';

import 'components/Wrapper.dart';
import 'components/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
   await GetStorage.init();
  runApp( 
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('fr'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('fr'),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
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
                
                    primary: primary,
                  ),
              primaryColor: primary,
            ),
            home: const WelcomeScreen(),
          );
        },
      ),
   ));
}

