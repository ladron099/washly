// ignore_for_file: file_names, non_constant_identifier_names

class TmpUser {
  String? phoneNo;
  String? password;
  String? email;
  bool? is_exist;
  String? type_auth;

  TmpUser({
    required this.phoneNo,
    required this.password,
    required this.email,
    required this.is_exist,
    required this.type_auth,
  });
  TmpUser.fromClient();

  factory TmpUser.fromJson(Map<String, dynamic> json) {
    return TmpUser(
      phoneNo: json['phoneNo'],
      password: json['password'],
      email: json['email'],
      is_exist: json['is_exist'],
      type_auth: json['type_auth'],
    );
  }

  Map<String, dynamic> toJson() => {
        'phoneNo': phoneNo,
        'password': password,
        'email': email,
        'is_exist': is_exist,
        'type_auth': type_auth,
      };
}
