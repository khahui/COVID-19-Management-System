import 'dart:ffi';

class UserModel {
  final int? id;
  final String name;
  final int age;
  final String location;
  final String area;
  final int bodyTemp;
  final String date;
  final String time;
  final String mobileNum;
  final String vaccStatus;
  final String riskStatus;

  UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.location,
    required this.area,
    required this.bodyTemp,
    required this.date,
    required this.time,
    required this.mobileNum,
    required this.vaccStatus,
    required this.riskStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      location: json["location"],
      area: json["area"],
      bodyTemp: json["bodyTemp"],
      date: json["date"],
      time: json["time"],
      mobileNum: json["mobileNum"],
      vaccStatus: json["vaccStatus"],
      riskStatus: json["riskStatus"]
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "age": age, "location": location, "area": area, "bodyTemp": bodyTemp, "date": date, "time": time, "mobileNum": mobileNum, "vaccStatus": vaccStatus, "riskStatus": riskStatus};
}
