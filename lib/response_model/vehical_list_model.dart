// class VehicleListModel {
//   int? id;
//   String? modelNumber;
//   String? registrationNumber;
//   String? vehicleType;
//   int? user;
//
//
//
//   VehicleListModel(
//       {this.id,
//         this.modelNumber,
//         this.registrationNumber,
//         this.vehicleType,
//         this.user});
//
//   VehicleListModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     modelNumber = json['model_number'];
//     registrationNumber = json['registration_number'];
//     vehicleType = json['vehicle_type'];
//     user = json['user'];
//   }
//
//
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['model_number'] = this.modelNumber;
//     data['registration_number'] = this.registrationNumber;
//     data['vehicle_type'] = this.vehicleType;
//     data['user'] = this.user;
//     return data;
//   }
//   }
class VehicleListModel {
  int? id;
  String? modelNumber;
  String? registrationNumber;
  String? user;
  String? vehicleType;
  List<Qr>? qr;

  VehicleListModel(
      {this.id,
        this.modelNumber,
        this.registrationNumber,
        this.user,
        this.vehicleType,
        this.qr});

  VehicleListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelNumber = json['model_number'];
    registrationNumber = json['registration_number'];
    user = json['user'];
    vehicleType = json['vehicle_type'];
    if (json['qr'] != null) {
      qr = <Qr>[];
      json['qr'].forEach((v) {
        qr!.add(new Qr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_number'] = this.modelNumber;
    data['registration_number'] = this.registrationNumber;
    data['user'] = this.user;
    data['vehicle_type'] = this.vehicleType;
    if (this.qr != null) {
      data['qr'] = this.qr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qr {
  int? id;
  String? image;
  int? vehicle;

  Qr({this.id, this.image, this.vehicle});

  Qr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    vehicle = json['vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['vehicle'] = this.vehicle;
    return data;
  }
}
