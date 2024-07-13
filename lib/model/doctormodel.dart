class DoctorModel {
  String? id;
  String? name;
  String? district;
  String? email;
  String? phone;
  String? gender;

  DoctorModel(
      {this.id, this.district, this.email, this.gender, this.name, this.phone});

  factory DoctorModel.fromjson(json) {
    return DoctorModel(
      id: json["id"],
      district: json["district"],
      email: json["email"],
      gender: json['gender'],
      name: json["name"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "district": district,
      "email": email,
      "gender": gender,
      "name": name,
      "price": phone
    };
  }
}
