class AdminLoginModel {

  final int? id;
  final String password;

  AdminLoginModel(
      { this.id,
        required this.password,
      });

  factory AdminLoginModel.fromJson(Map<String, dynamic> json) {
    return AdminLoginModel(
      id: json["id"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "password": password};
}
