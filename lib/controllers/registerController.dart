import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:washly/utils/models/list_item.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';
import 'package:washly/views/screens/phone_screen.dart';
import 'package:washly/views/screens/profile_picture_screen.dart';

import '../utils/dialogs.dart';
import '../utils/models/tmp_user.dart';
import '../utils/services.dart';

class RegisterController extends GetxController {
  var loading = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController(); 
  String? gender;
  DateTime? birthdate;
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
        await isUserExist(emailController.text.trim()).then((value) {
          if (value != "") {
            showAlertDialogOneButton(Get.context!, "Email already exists",
                "Enter a new email.", "Ok");
            return;
          } else {
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim())
                .then((value) async {
              User? user = value.user;
              if (user != null) {
                Client client = Client(
                    client_uid: user.uid,
                    client_full_name: firstNameController.text.trim() +
                        " " +
                        lastNameController.text.trim(),
                    client_email: emailController.text.trim(),
                    client_phone_number: '',
                    client_picture: "",
                    client_date_naissance: "$birthdate",
                    client_sexe: gender!,
                    client_auth_type: 'Email',
                    is_activated_account: false,
                    client_cancelled_delivery: 0,
                    client_succeded_delivery: 0,
                    client_planned_delivery: 0,
                    client_stars_mean: 0,
                    client_note: 0,
                    client_last_order_state: false,
                    client_last_login_date:
                        DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                            .format(DateTime.now()),
                    client_registration_date:
                        DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                            .format(DateTime.now()),
                    is_deleted_account: false,
                    is_verified_account: false,
                    client_city: cityController.text,
                    client_longitude: 0,
                    client_latitude: 0,
                    client_total_orders: 0);
                await SessionManager().set(
                  'tmpUser',
                  TmpUser(
                    phoneNo: '',
                    password: '',
                    email: user.email!,
                    is_exist: false,
                    type_auth: "Google",
                  ),
                );
                GetStorage().write('user_status', 'profile');
                await SessionManager().set('currentUser', client);
                await createUser(client).then(
                  (value) async {
                    Get.to(() => ProfilePictureScreen());
                    loading.toggle();
                    update();
                  },
                );
              }
            });
          }
        });
        loading.toggle();
        update();
      }
    });
  }

  Future<bool> validate() {
    if (firstNameController.text.trim().isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "first name empty", "Enter your first name.", "Ok");
      return Future.value(false);
    }
    if (lastNameController.text.trim().isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "last name empty", "Enter your last name.", "Ok");
      return Future.value(false);
    }
    if (emailController.text.trim().isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "email empty", "Enter your email.", "Ok");
      return Future.value(false);
    }
    if (!EmailValidator.validate(emailController.text.trim())) {
      showAlertDialogOneButton(
          Get.context!, "Email invalid", "Enter a valid email.", "Ok");
      return Future.value(false);
    }
    if (!validator.password(passwordController.text)) {
      showAlertDialogOneButton(
          Get.context!, "Password invalid", "Enter a valid password.", "Ok");
      return Future.value(false);
    }
    if (passwordController.text.isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "password empty", "Enter your password.", "Ok");
      return Future.value(false);
    }
    if (cityController.text.isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "city empty", "Enter your city.", "Ok");
      return Future.value(false);
    }
    if(birthdate==null) {
       showAlertDialogOneButton(
          Get.context!, "birthdate empty", "Enter your birthdate.", "Ok");
      return Future.value(false);
    }
    if(gender==null){
       showAlertDialogOneButton(
          Get.context!, "gender empty", "Enter your gender.", "Ok");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dropdownSexeItems = buildDropDownMenuItems(sexeItems);
    sexe = dropdownSexeItems![0].value;
    update();
  }
}
