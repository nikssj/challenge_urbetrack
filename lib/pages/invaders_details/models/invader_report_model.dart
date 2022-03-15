class InvaderReport {
  int? userId;
  String? dateTime;
  String? characterName;
  int? id;

  InvaderReport({this.userId, this.dateTime, this.characterName, this.id});

  InvaderReport.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    dateTime = json['dateTime'];
    characterName = json['character_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['dateTime'] = this.dateTime;
    data['character_name'] = this.characterName;
    data['id'] = this.id;

    return data;
  }
}
