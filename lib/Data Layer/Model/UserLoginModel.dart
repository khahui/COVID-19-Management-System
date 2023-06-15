class UserLoginModel {

  final int? id;
  final String password;

  UserLoginModel(
      { this.id,
        required this.password,
      });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      id: json["id"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "password": password};
}
