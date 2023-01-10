import 'package:get/state_manager.dart';

class ServicesController extends GetxController{
  int? currIndex ;
  List<String> filtredServices=['EXPRESS','STANDARD','PREMIUM','FULL SERVICE'] ;

  
  switchIndex(index){
    currIndex = index;
    update();
  }

  

}