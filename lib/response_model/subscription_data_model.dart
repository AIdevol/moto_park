class SubscCardModel {
  int? id;
  String? createdTime;
  String? modifiedTime;
  String? name;
  int? tenure;
  bool? active;
  String? createdBy;
  String? modifiedBy;
  String? months;
  String? rupees;
  String? timed;

  SubscCardModel({
    this.id,
    this.createdTime,
    this.modifiedTime,
    this.name,
    this.tenure,
    this.active,
    this.createdBy,
    this.modifiedBy,
    this.months,
    this.rupees,
    this. timed,
  });

  factory SubscCardModel.fromJson(Map<String, dynamic> json) {
    return SubscCardModel(
      id: json['id'],
      createdTime: json['created_time'],
      modifiedTime: json['modified_time'],
      name: json['name'],
      tenure: json['tenure'],
      active: json['active'],
      createdBy: json['created_by'],
      modifiedBy: json['modified_by'],
      months: json['months'],
      rupees: json['rupees'] ?? '',
      timed: json['timed'] ?? '',
    );
  }

}
