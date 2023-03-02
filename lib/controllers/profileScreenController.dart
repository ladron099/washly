import 'package:get/get.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/services.dart';

class ProfileScreenController extends GetxController{

RxBool loading = false.obs;
  Client? client;






  @override
  void onInit() {
    loading.toggle();
    update();
    super.onInit();
    getUserFromMemory().then((value) {
      client = value;
      update();
    }); 
    loading.toggle();
    update();
  }
}