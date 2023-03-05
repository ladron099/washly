import 'dart:async';

import 'package:get/get.dart';

class WaveLoadingController extends GetxController {
  double _progress = 0.0;
  double get progress => _progress;

  void _incrementCounter() {
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      _progress += 1;
      if (_progress > 100) {
        _progress = 0;
      }
      update();
    });
  }

  @override
  void onInit() {
    _incrementCounter();
    super.onInit();
  }
}
