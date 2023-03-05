import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:washly/controllers/homeController.dart';
import 'package:washly/controllers/profileScreenController.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/home_screen.dart';

import '../utils/quires.dart';
import '../views/screens/phone_screen.dart';

class EditProfilePictureController extends GetxController {
  final profileController = Get.put(ProfileScreenController());
  final homeController = Get.put(HomeController());
  RxBool loading = false.obs;
  Client? userBase;
  XFile? file;
  File? image;

  selectImage() async {
    try {
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        image = File(file!.path);
        update();
      }
    } catch (ex) {
      throw ex.toString();
    }
  }

  uploadImage() async {
    String fileName = "";
    loading.toggle();
    update();
    if (file != null) {
      FirebaseStorage.instance
          .ref('user-images/${file!.name}')
          .putFile(image!)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) async {
          fileName = value;
          userBase!.client_picture = fileName;
             userBase!.client_status = 'verified';
              saveCurrentUser(userBase!);
          await saveCurrentUser(userBase!);
          await completeUser(userBase!).then((value) {
            if (value) {
              profileController.client = userBase;
              profileController.update();
              homeController.client = userBase;
              
              GetStorage().write('user_status', 'verified');
              userBase!.client_status = 'verified';
              saveCurrentUser(userBase!);
              homeController.update();
              Get.snackbar('Success', 'Picture had been updated successfully.');
            }
            loading.toggle();
            update();
          });
        });
      });
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getUserFromMemory().then((value) async {
      userBase = value;
      update();
      print(userBase);
    });
  }
}
