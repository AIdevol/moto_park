class  UserDataModal{
  String? sId;
  String? email;
  String? bio;
  String? companyCode;
  String? createdAt;
  String? department;
  bool? isGeneralPreferenceNotification;
  bool? isNewCommentPreferenceNotification;
  bool? isNewFollowerPreferenceNotification;
  bool? isNewLikedPostPreferenceNotification;
  bool? isNewNotification;
  bool? isNewPostPreferenceNotification;
  bool? isVerified;
  bool? isFollowedBy;
  String? name;
  String? password;
  String? profileImageLink;
  String? registerWith;
  String? updatedAt;
  String? fcmToken;
  String? jWTTOKEN;

  String? userID;
  String? notificationPreference;

  UserDataModal(
      {this.sId,
        this.email,
        this.bio,
        this.companyCode,
        this.createdAt,
        this.department,
        this.isGeneralPreferenceNotification,
        this.isNewCommentPreferenceNotification,
        this.isNewFollowerPreferenceNotification,
        this.isNewLikedPostPreferenceNotification,
        this.isNewNotification,
        this.isNewPostPreferenceNotification,
        this.isVerified,
        this.name,
        this.password,
        this.profileImageLink,
        this.registerWith,
        this.updatedAt,
        this.fcmToken,
        this.jWTTOKEN,this.isFollowedBy,
      this.userID,this.notificationPreference});

  UserDataModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    bio = json['bio'];
    companyCode = json['companyCode'];
    createdAt = json['createdAt'];
    department = json['department'];
    isGeneralPreferenceNotification = json['isGeneralPreferenceNotification'];
    isNewCommentPreferenceNotification =
    json['isNewCommentPreferenceNotification'];
    isNewFollowerPreferenceNotification =
    json['isNewFollowerPreferenceNotification'];
    isNewLikedPostPreferenceNotification =
    json['isNewLikedPostPreferenceNotification'];
    isNewNotification = json['isNewNotification'];
    isNewPostPreferenceNotification = json['isNewPostPreferenceNotification'];
    isVerified = json['isVerified'];
    name = json['name'];
    password = json['password'];
    profileImageLink = json['profileImageLink'];
    registerWith = json['registerWith'];
    updatedAt = json['updatedAt'];
    fcmToken = json['fcmToken'];
    jWTTOKEN = json['JWT_TOKEN'];
    userID = json['userID'];
    isFollowedBy = json['isFollowedBy'];
    notificationPreference = json['notificationPreference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['companyCode'] = this.companyCode;
    data['createdAt'] = this.createdAt;
    data['department'] = this.department;
    data['isGeneralPreferenceNotification'] =
        this.isGeneralPreferenceNotification;
    data['isNewCommentPreferenceNotification'] =
        this.isNewCommentPreferenceNotification;
    data['isNewFollowerPreferenceNotification'] =
        this.isNewFollowerPreferenceNotification;
    data['isNewLikedPostPreferenceNotification'] =
        this.isNewLikedPostPreferenceNotification;
    data['isNewNotification'] = this.isNewNotification;
    data['isNewPostPreferenceNotification'] =
        this.isNewPostPreferenceNotification;
    data['isVerified'] = this.isVerified;
    data['name'] = this.name;
    data['password'] = this.password;
    data['profileImageLink'] = this.profileImageLink;
    data['registerWith'] = this.registerWith;
    data['updatedAt'] = this.updatedAt;
    data['fcmToken'] = this.fcmToken;
    data['JWT_TOKEN'] = this.jWTTOKEN;
    data['userID'] = this.userID;
    data['isFollowedBy'] = this.isFollowedBy;
    data['notificationPreference'] = this.notificationPreference;
    return data;
  }
}