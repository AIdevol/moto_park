class VacancyResponseModel {
  List<VacancyList>? data;

  VacancyResponseModel({this.data});

  VacancyResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VacancyList>[];
      json['data'].forEach((v) {
        data!.add(new VacancyList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VacancyList {
  String? sId;
  String? position;
  String? roles;
  int? flag;
  String? createTime;
  int? iV;
  String? endTime;
  String? experience;
  String? salary;
  String? title;
  String? type;

  VacancyList(
      {this.sId,
        this.position,
        this.roles,
        this.flag,
        this.createTime,
        this.iV,
        this.endTime,
        this.experience,
        this.salary,
        this.title,
        this.type});

  VacancyList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    position = json['position'];
    roles = json['roles'];
    flag = json['flag'];
    createTime = json['create_time'];
    iV = json['__v'];
    endTime = json['end_time'];
    experience = json['experience'];
    salary = json['salary'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['position'] = this.position;
    data['roles'] = this.roles;
    data['flag'] = this.flag;
    data['create_time'] = this.createTime;
    data['__v'] = this.iV;
    data['end_time'] = this.endTime;
    data['experience'] = this.experience;
    data['salary'] = this.salary;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
