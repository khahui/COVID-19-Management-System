class AdminVaccinationModel {
  final int? id;
  final String place;
  final String date;
  final int time;

  AdminVaccinationModel({
    this.id,
    required this.place,
    required this.date,
    required this.time,
  });

  factory AdminVaccinationModel.fromJson(Map<String, dynamic> json) {
    return AdminVaccinationModel(
      id: json["id"],
      place: json["place"],
      date: json["date"],
      time: json["time"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "place": place, "date": date, "time": time};
}
