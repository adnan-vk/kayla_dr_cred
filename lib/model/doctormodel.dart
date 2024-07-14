class DoctorModel {
  String? id;
  String? name;
  String? district;
  String? email;
  String? phone;
  String? gender;
  String? imageUrl;

  DoctorModel(
      {this.id,
      this.district,
      this.email,
      this.gender,
      this.name,
      this.phone,
      this.imageUrl});

  factory DoctorModel.fromjson(json) {
    return DoctorModel(
      id: json["id"],
      district: json["district"],
      email: json["email"],
      gender: json['gender'],
      name: json["name"],
      phone: json["phone"],
      imageUrl: json["imageurl"],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "district": district,
      "email": email,
      "gender": gender,
      "name": name,
      "phone": phone,
      "imageurl": imageUrl,
    };
  }
}
