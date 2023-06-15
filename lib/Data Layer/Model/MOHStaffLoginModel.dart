class MOHStaffLoginModel {
  final int? id;
  final String password;

  MOHStaffLoginModel({
    this.id,
    required this.password,
  });

  factory MOHStaffLoginModel.fromJson(Map<String, dynamic> json) {
    return MOHStaffLoginModel(
      id: json["id"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "password": password};
}
