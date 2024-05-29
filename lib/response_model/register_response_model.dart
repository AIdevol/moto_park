/*class RegisterResponseModel {
  String? message;
  String? accessToken;
  UserDetails? userDetails;

  RegisterResponseModel({this.message, this.accessToken, this.userDetails});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? gender;
  String? bloodGroup;
  String? dateOfBirth;
  String? emergencyContact1;
  String? emergencyContact2;
  String? userRole;
  bool? isActive;
  List<dynamic>? assignedQrCodes;
  var parent;
  bool? qrCodePermission;

  UserDetails(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.gender,
      this.bloodGroup,
      this.dateOfBirth,
      this.emergencyContact1,
      this.emergencyContact2,
      this.userRole,
      this.isActive,
      this.assignedQrCodes,
      this.parent,
      this.qrCodePermission});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    dateOfBirth = json['date_of_birth'];
    emergencyContact1 = json['emergency_contact1'];
    emergencyContact2 = json['emergency_contact2'];
    userRole = json['user_role'];
    isActive = json['is_active'];
    if (json['assigned_qr_codes'] != null) {
      assignedQrCodes = <dynamic>[];
      json['assigned_qr_codes'].forEach((v) {
        // assignedQrCodes!.add(new Null.fromJson(v));
      });
    }
    parent = json['parent'];
    qrCodePermission = json['qr_code_permission'];
  }

  get address => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['date_of_birth'] = this.dateOfBirth;
    data['emergency_contact1'] = this.emergencyContact1;
    data['emergency_contact2'] = this.emergencyContact2;
    data['user_role'] = this.userRole;
    data['is_active'] = this.isActive;
    if (this.assignedQrCodes != null) {
      data['assigned_qr_codes'] =
          this.assignedQrCodes!.map((v) => v.toJson()).toList();
    }
    data['parent'] = this.parent;
    data['qr_code_permission'] = this.qrCodePermission;
    return data;
  }
}*/






class RegisterResponseModel {
  String? message;
  String? accessToken;
  String? refreshToken;
  UserDetails? userDetails;

  RegisterResponseModel(
      {this.message, this.accessToken, this.refreshToken, this.userDetails});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? email;
  var firstName;
  var lastName;
  String? phone;
  String? gender;
  String? bloodGroup;
  String? dateOfBirth;
 var emergencyContact;
 var emergencyContact2;
 var department;
  String? userRole;
  bool? isActive;
  List<dynamic>? assignedQrCodes;
  var parent;
  bool? qrCodePermission;
  var city;
  var state;
  var country;
  var zipCode;
  String? address;
  bool? exportPermission;
  var userImage;
  List<dynamic>? userPermissions;

  UserDetails(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.phone,
        this.gender,
        this.bloodGroup,
        this.dateOfBirth,
        this.emergencyContact,
        this.emergencyContact2,
        this.department,
        this.userRole,
        this.isActive,
        this.assignedQrCodes,
        this.parent,
        this.qrCodePermission,
        this.city,
        this.state,
        this.country,
        this.zipCode,
        this.address,
        this.exportPermission,
        this.userImage,
        this.userPermissions});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    dateOfBirth = json['date_of_birth'];
    emergencyContact = json['emergency_contact'];
    emergencyContact2 = json['emergency_contact2'];
    department = json['department'];
    userRole = json['user_role'];
    isActive = json['is_active'];
    if (json['assigned_qr_codes'] != null) {
      assignedQrCodes = <Null>[];
      json['assigned_qr_codes'].forEach((v) {
        // assignedQrCodes!.add(new Null.fromJson(v));
      });
    }
    parent = json['parent'];
    qrCodePermission = json['qr_code_permission'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zip_code'];
    address = json['address'];
    exportPermission = json['export_permission'];
    userImage = json['user_image'];
    if (json['user_permissions'] != null) {
      userPermissions = <Null>[];
      json['user_permissions'].forEach((v) {
        // userPermissions!.add(new Null.fromJson(v));
      });
    }
  }

  get profilePictureUrl => null;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['date_of_birth'] = this.dateOfBirth;
    data['emergency_contact'] = this.emergencyContact;
    data['emergency_contact2'] = this.emergencyContact2;
    data['department'] = this.department;
    data['user_role'] = this.userRole;
    data['is_active'] = this.isActive;
    if (this.assignedQrCodes != null) {
      data['assigned_qr_codes'] =
          this.assignedQrCodes!.map((v) => v.toJson()).toList();
    }
    data['parent'] = this.parent;
    data['qr_code_permission'] = this.qrCodePermission;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['export_permission'] = this.exportPermission;
    data['user_image'] = this.userImage;
    if (this.userPermissions != null) {
      data['user_permissions'] =
          this.userPermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

