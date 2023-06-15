class AdminModel {
  final int? id;
  final String name;
  final int age;
  final String symptoms;
  final String bodycondition;
  final String quarantineplace;

  AdminModel({
    this.id,
    required this.name,
    required this.age,
    required this.symptoms,
    required this.bodycondition,
    required this.quarantineplace,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      symptoms: json["symptoms"],
      bodycondition: json["bodycondition"],
      quarantineplace: json["quarantineplace"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "symptoms": symptoms,
        "bodycondition": bodycondition,
        "quarantineplace": quarantineplace
      };
}
