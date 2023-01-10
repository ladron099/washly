import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/utils/models/car.dart';
import 'package:washly/utils/models/order.dart';

class EnterAddressController extends GetxController {
  BitmapDescriptor? clienticon;
  CameraPosition? kGooglePlex;
  double? latitude, longtitude;
  double mapHeight=545.h;
  double ordianry=545.h;
  int? choosenIndex;
  TextEditingController addressController = TextEditingController();
  bool isCurrent = false;
  bool isSaved = false;
  bool isNew = false;
  bool isNone = true;
  String? city;
  final Set<Marker> markers = {};
  Order? order;
  Completer<GoogleMapController> mapController = Completer();
  RxBool loading = true.obs;
  bool filled2 = false;
  bool filled3 = false;
  int step = 1;

  getUserLocation() async {
    clienticon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2, size: Size(5.w, 5.w)),
      'assets/images/clientmarker.png',
    );
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
    // markers.add(
    //   Marker(
    //     markerId: const MarkerId('id-1'),
    //     icon: clienticon!,
    //     position: LatLng(
    //       latitude!+0.001,
    //       longtitude!,
    //     ),
    //   ),
    // );
    loading.toggle();
    update();
  }

  reset() {
    isNone = true;
    isCurrent = false;
    isSaved = false;
    isNew = false;
    mapHeight =ordianry;
    addressController.text = "";
    update();
  }

  getOrder() {
    order = Order(
      clientFullName: 'Mohamed Ali',
      distance: 2.5,
      clientAvatar: 'assets/images/profile.png',
      orderType: 'Car',
      orderStatus: 1,
      orderCar: Car(
        carName: "Bmw",
        carType: "Grande",
        carMark: "Nark",
        carModel: 4584,
        carColor: "red",
        carMatricule: "35q3eef",
        carPicture: "assets/images/car.png",
      ),
    );
  }

  next() {
    if (step == 1) {
      filled2 = true;
      step += 1;
    } else if (step == 2) {
      filled3 = true;
      step += 1;
      // Get.to(() => OrderDoneScreen(), transition: Transition.rightToLeft);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
    getOrder();
  }
}
