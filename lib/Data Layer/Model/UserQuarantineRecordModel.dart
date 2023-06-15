class UserModel {
  final int? id;
  final String name;
  final int age;
  final String symptoms;
  final String bodycondition;

  UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.symptoms,
    required this.bodycondition,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      symptoms: json["symptoms"],
      bodycondition: json["bodycondition"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "symptoms": symptoms,
        "bodyccondition": bodycondition
      };
}
