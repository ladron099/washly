import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/waveLoadingController.dart';
import 'package:washly/utils/constants.dart';
import 'package:wave_loading_indicator/wave_progress.dart';

class WaveLoadingScreen extends StatefulWidget {
  const WaveLoadingScreen({super.key});

  @override
  State<WaveLoadingScreen> createState() => _WaveLoadingScreenState();
}

class _WaveLoadingScreenState extends State<WaveLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<WaveLoadingController>(
          init: WaveLoadingController(),
          builder: (controller) {
            return Center(
              child: WaveProgress(
                borderSize: 4,
                size: 180.sp,
                borderColor: redColor,
                foregroundWaveColor: primaryColor,
                backgroundWaveColor: secondaryColor,
                progress: controller.progress,
                innerPadding: 6.h,
              ),
            );
          }),
    );
  }
}
