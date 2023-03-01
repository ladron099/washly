// ignore_for_file: file_names, non_constant_identifier_names

class Client {
  String client_uid;
  String client_full_name;
  String client_email;
  String client_phone_number;
  String client_picture;
  String client_registration_date;
  String client_date_naissance;
  String client_sexe;
  String client_auth_type;
  bool is_deleted_account;
  bool is_activated_account;
  bool is_verified_account;
  int client_cancelled_delivery;
  int client_succeded_delivery;
  int client_planned_delivery;
  String client_last_login_date;
  int client_stars_mean;
  double client_note;
  bool client_last_order_state;
  String client_city;
  double client_longitude;
  double client_latitude;
  String? client_fcm;
  int client_total_orders;
  int? client_reported_times;

  Client({
    required this.client_uid,
    required this.client_full_name,
    required this.client_email,
    required this.client_phone_number,
    required this.client_picture,
    required this.client_registration_date,
    required this.client_date_naissance,
    required this.client_sexe,
    required this.client_auth_type,
    required this.is_deleted_account,
    required this.is_activated_account,
    required this.is_verified_account,
    required this.client_cancelled_delivery,
    required this.client_succeded_delivery,
    required this.client_planned_delivery,
    required this.client_last_login_date,
    required this.client_stars_mean,
    required this.client_note,
    required this.client_last_order_state,
    required this.client_city,
    required this.client_longitude,
    required this.client_latitude,
    this.client_fcm,
    required this.client_total_orders,
    this.client_reported_times
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      client_uid: json['client_uid'],
      client_full_name: json['client_full_name'],
      client_email: json['client_email'],
      client_phone_number: json['client_phone_number'],
      client_picture: json['client_picture'],
      client_registration_date: json['client_registration_date'],
      client_date_naissance: json['client_date_naissance'],
      client_sexe: json['client_sexe'],
      client_auth_type: json['client_auth_type'],
      is_deleted_account: json['is_deleted_account'],
      is_activated_account: json['is_activated_account'],
      is_verified_account: json['is_verified_account'],
      client_cancelled_delivery: json['client_cancelled_delivery'],
      client_succeded_delivery: json['client_succeded_delivery'],
      client_planned_delivery: json['client_planned_delivery'],
      client_last_login_date: json['client_last_login_date'],
      client_stars_mean: 0,
      client_note: json['client_note'].toDouble() ?? 0,
      client_last_order_state: json['client_last_order_state'],
      client_city: json['client_city'],
      client_longitude: double.parse(json['client_longitude'].toString()),
      client_latitude: double.parse(json['client_latitude'].toString()),
      client_fcm: json['client_fcm'],
      client_total_orders: json['client_total_orders'] ?? 0,
      client_reported_times: json['client_reported_times'] ?? 0,

    );
  }

  Map<String, dynamic> toJson() => {
        'client_uid': client_uid,
        'client_full_name': client_full_name,
        'client_email': client_email,
        'client_phone_number': client_phone_number,
        'client_picture': client_picture,
        'client_registration_date': client_registration_date,
        'client_date_naissance': client_date_naissance,
        'client_sexe': client_sexe,
        'client_auth_type': client_auth_type,
        'is_deleted_account': is_deleted_account,
        'is_activated_account': is_activated_account,
        'is_verified_account': is_verified_account,
        'client_cancelled_delivery': client_cancelled_delivery,
        'client_succeded_delivery': client_succeded_delivery,
        'client_planned_delivery': client_planned_delivery,
        'client_last_login_date': client_last_login_date,
        'client_stars_mean': client_stars_mean,
        'client_note': client_note,
        'client_last_order_state': client_last_order_state,
        'client_city': client_city,
        'client_longitude': client_longitude,
        'client_latitude': client_latitude,
        'client_fcm':client_fcm,
        'client_total_orders':client_total_orders,
        'client_reported_times':client_reported_times
      };
}
