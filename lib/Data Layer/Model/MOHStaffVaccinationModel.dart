class MOHStaffVaccinationModel {
  final int? id;
  final String date;
  final int time;
  final String manufacturer;
  final int vaccineNum;
  final String batchNum;
  final String expiryDate;
  final String vaccStatus;

  MOHStaffVaccinationModel({
    this.id,
    required this.date,
    required this.time,
    required this.manufacturer,
    required this.vaccineNum,
    required this.batchNum,
    required this.expiryDate,
    required this.vaccStatus,
  });

  factory MOHStaffVaccinationModel.fromJson(Map<String, dynamic> json) {
    return MOHStaffVaccinationModel(
      id: json["id"],
      date: json["date"],
      time: json["time"],
      manufacturer: json["manufacturer"],
      vaccineNum: json["vaccineNum"],
      batchNum: json["batchNum"],
      expiryDate: json["expiryDate"],
      vaccStatus: json["vaccStatus"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "time": time,
        "manufacturer": manufacturer,
        "vaccineNum": vaccineNum,
        "batchNum": batchNum,
        "expiryDate": expiryDate,
        "vaccStatus": vaccStatus,
      };
}
