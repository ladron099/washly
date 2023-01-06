import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:washly/utils/models/list_item.dart';


class EditInfoController extends GetxController{
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

  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     dropdownSexeItems = buildDropDownMenuItems(sexeItems);
    sexe = dropdownSexeItems![0].value; 
    update();
  }
}