import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:washly/utils/models/user.dart';

Future<String> isUserExist(email) async {
  String provider = '';
  await FirebaseFirestore.instance
      .collection('users')
      .where('client_email', isEqualTo: email)
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) async {
    List<DocumentSnapshot> documentSnapshot = value.docs;
    if (value.size != 0) {
      provider = documentSnapshot[0]['client_auth_type'];
      print(documentSnapshot[0]['client_auth_type']);
      print(documentSnapshot[0]['client_email']);
    }
  });

  await FirebaseFirestore.instance
      .collection('washers')
      .where('washer_email', isEqualTo: email)
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) async {
    List<DocumentSnapshot> documentSnapshot = value.docs;
    if (value.size != 0) provider = documentSnapshot[0]['washer_type_auth'];
  });

  return provider;
}

Future completeUser(Client user) async {
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(user.client_uid);
  await docUser.update(user.toJson());
  return true;
}

Future<Client> getUser(uid) async {
  Client user;
  var docSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

  Map<String, dynamic>? data = docSnapshot.data();
  user = Client.fromJson(data!);
  if (user == null) {
    user = Client(
        client_uid: "",
        client_full_name: "",
        client_email: "",
        client_phone_number: '-',
        client_picture: "",
        client_date_naissance: '',
        client_sexe: '',
        client_auth_type: 'Google',
        is_activated_account: false,
        client_cancelled_delivery: 0,
        client_succeded_delivery: 0,
        client_planned_delivery: 0,
        client_stars_mean: 0,
        client_note: 0,
        client_last_order_state: false,
        client_last_login_date:
            DateFormat("dd-MM-yyyy HH:mm", "Fr_fr").format(DateTime.now()),
        client_registration_date:
            DateFormat("dd-MM-yyyy HH:mm", "Fr_fr").format(DateTime.now()),
        is_deleted_account: false,
        is_verified_account: false,
        client_city: '',
        client_longitude: 0,
        client_latitude: 0,
        client_total_orders: 0);
  }

  return user;
}

Future<bool> getUserStatus(phone) async {
  bool isVerified = false;
  await FirebaseFirestore.instance
      .collection('users')
      .where('client_phone_number', isEqualTo: phone)
      .where('is_deleted_account', isEqualTo: false)
      .where('client_auth_type', isEqualTo: 'Phone')
      .snapshots()
      .first
      .then((value) {
    if (value.size != 0) {
      isVerified = value.docs.first.get('is_verified_account');
    }
  });

  return isVerified;
}

Future<String> checkPhoneNumber(phoneNo) async {
  String message = "not-found";

  await FirebaseFirestore.instance
      .collection('washers')
      .where('washer_phone_number', isEqualTo: phoneNo)
      .where('washer_type_auth', whereIn: ["Phone", "Facebook", "Google"])
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) {
        if (value.size != 0) message = "found-in-washers";
      });

  await FirebaseFirestore.instance
      .collection('users')
      .where('client_phone_number', isEqualTo: phoneNo)
      .where('client_auth_type', whereIn: ["Phone", "Facebook", "Google"])
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) {
        if (value.size != 0) message = "found-in-users";
      });

  return message;
}
