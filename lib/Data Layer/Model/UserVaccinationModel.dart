class UserVaccinationModel {
  final int? id;
  final String name;
  final String icpn; //IC/PassportNo
  final int age;
  final String gender;
  final String address;
  final int postcode;
  final String state;

  UserVaccinationModel({
    this.id,
    required this.name,
    required this.icpn,
    required this.age,
    required this.gender,
    required this.address,
    required this.postcode,
    required this.state,
  });

  factory UserVaccinationModel.fromJson(Map<String, dynamic> json) {
    return UserVaccinationModel(
      id: json["id"],
      name: json["name"],
      icpn: json["icpn"],
      age: json["age"],
      gender: json["gender"],
      address: json["address"],
      postcode: json["postcode"],
      state: json["state"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icpn": icpn,
        "age": age,
        "gender": gender,
        "address": address,
        "postcode": postcode,
        "state": state
      };
}
