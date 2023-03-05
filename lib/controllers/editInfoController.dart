import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:washly/controllers/homeController.dart';
import 'package:washly/controllers/profileScreenController.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/list_item.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';

import '../utils/services.dart';

class EditInfoController extends GetxController {
  var loading = false.obs;
  final profileController = Get.put(ProfileScreenController());
  final homeController = Get.put(HomeController());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Client? client;
  List<DropdownMenuItem<ListItem>>? dropdownSexeItems;
  ListItem? sexe;
  final List<ListItem> sexeItems = [
    ListItem("-", "Sélectionnez votre sexe"),
    ListItem("male", "Homme"),
    ListItem("female", "Femme"),
  ];

  String birthday = "Entrez votre date de naissance";

  dropDownMenuChange(value) {
    sexe = value;
  }

  List<DropdownMenuItem<ListItem>>? buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>>? items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(listItem.name),
        ),
      );
    }
    return items;
  }

  submit() {
    validate().then((value) async {
      if (value) {
        loading.toggle();
        update();
        client!.client_full_name = firstNameController.text.trim() +
            " " +
            lastNameController.text.trim();
        client!.client_city = cityController.text.trim();
        client!.client_date_naissance = birthday;
        client!.client_sexe = sexe!.value;
        saveCurrentUser(client!);
        await completeUser(client!);
        profileController.client = client;
        homeController.client = client;
        profileController.update();
        homeController.update();
        loading.toggle();
        update();
      }
    });
  }

  Future<bool> validate() {
    if (firstNameController.text.trim().isEmpty) {
    Get.snackbar("Error", "Enter your first name.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    if (lastNameController.text.trim().isEmpty) {
     Get.snackbar("Error", "Enter your last name.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    if (emailController.text.trim().isEmpty) {
    Get.snackbar("Error", "Enter your email.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    if (!EmailValidator.validate(emailController.text.trim())) {
    Get.snackbar("Error", "Enter a valid email.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }

    if (cityController.text.isEmpty) {
    Get.snackbar("Error", "Enter your city.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    if (birthday == null) {
      Get.snackbar("Error", "Enter your birthday.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    if (sexe!.value == null) {
      Get.snackbar("Error", "Enter your sexe.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return Future.value(false);
    }
    return Future.value(true);
  }

  getOldData() {
    firstNameController.text = client!.client_full_name.split(" ")[0];
    lastNameController.text = client!.client_full_name.split(" ")[1];
    emailController.text = client!.client_email;
    cityController.text = client!.client_city;
    birthday = client!.client_date_naissance.split(" ")[0];
    client!.client_sexe == 'male'
        ? sexe = dropdownSexeItems![1].value
        : sexe = dropdownSexeItems![2].value;
  }

  @override
  void onInit() async {
    loading.toggle();
    update();
    // TODO: implement onInit
    super.onInit();
    dropdownSexeItems = buildDropDownMenuItems(sexeItems);
    sexe = dropdownSexeItems![0].value;
    await getUserFromMemory().then((value) {
      client = value;
      getOldData();
    });
    loading.toggle();
    update();
  }
}
