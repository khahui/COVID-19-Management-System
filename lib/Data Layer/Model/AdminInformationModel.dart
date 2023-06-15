class AdminModel {
  final String title;
  final String type;
  final DateTime dateTime;
  final String description;

  AdminModel(
      {required this.title,
      required this.type,
      required this.dateTime,
      required this.description});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
        title: json["title"],
        type: json["type"],
        dateTime: json["dateTime"],
        description: json["description"]);
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
        "dateTime": dateTime,
        "description": description
      };
}
