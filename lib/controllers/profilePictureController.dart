import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:washly/utils/services.dart';

import '../utils/models/tmp_user.dart';
import '../utils/models/user.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/quires.dart';
import '../views/screens/phone_screen.dart';

class ProfilePictureController extends GetxController {
  Client? userBase;
  RxBool loading = false.obs;
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
        });
      });
    }

    userBase!.client_picture = fileName;
    await saveCurrentUser(userBase!);
    await completeUser(userBase!).then((value) {
      if (value) {
        Get.offAll(() => PhoneScreen());
        loading.toggle();
        update();
      }
    });
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