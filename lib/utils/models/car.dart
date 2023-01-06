class Car {
  String? carName;
  String? carType;
  String? carMark;
  int? carModel;
  String? carColor;
  String? carMatricule;
  String? carPicture;

  Car(
      {this.carName,
      this.carType,
      this.carMark,
      this.carModel,
      this.carColor,
      this.carMatricule, this.carPicture});

  Car.fromJson(Map<String, dynamic> json) {
    carName = json['car_name'];
    carType = json['car_type'];
    carMark = json['car_mark'];
    carModel = json['car_model'];
    carColor = json['car_color'];
    carMatricule = json['car_matricule'];
    carPicture = json['car_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_name'] = this.carName;
    data['car_type'] = this.carType;
    data['car_mark'] = this.carMark;
    data['car_model'] = this.carModel;
    data['car_color'] = this.carColor;
    data['car_matricule'] = this.carMatricule;
    data['car_picture'] = this.carPicture;
    return data;
  }
}