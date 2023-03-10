import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/utils/models/car.dart';
import 'package:washly/utils/models/order.dart';

class OrderDetailsController extends GetxController{


  BitmapDescriptor?  clienticon;
  CameraPosition? kGooglePlex;
  double? latitude, longtitude;
  String? city;
  final Set<Marker> markers = {};
  Order? order;
  Completer<GoogleMapController> mapController = Completer();
  RxBool loading = false.obs;

  
 getUserLocation() async {
    clienticon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2,size: Size(5.w, 5.w)),
        'assets/images/clientmarker.png',);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16,
    );
    latitude = position.latitude;
    longtitude = position.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: "fr_FR");
    city = placemarks.first.locality;  
    markers.add(
      Marker(
        markerId: const MarkerId('id-1'),
        icon: clienticon!,
        position: LatLng(
          latitude!,
          longtitude!,
        ),
      ),
    );
    loading.toggle();
    update();
  }
  getOrder(){
   order = Order(
      clientFullName: 'Mohamed Ali',
      distance: 2.5,
      clientAvatar: 'assets/images/profile.png',
      orderType: 'Car',
      orderStatus: 1,
      orderCar: Car(
          carName:"Bmw",
   carType:"Grande",
   carMark:"Nark",
   carModel:4584,
   carColor:"red",
   carMatricule:"35q3eef",
   carPicture:"assets/images/car.png",
      ),

      );
  }


  @override
  void onInit() {
    super.onInit();
    getUserLocation();
    getOrder();
  }
}