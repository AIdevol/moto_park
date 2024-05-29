class UserData {
  final String name, email, phoneNumber, gender, address, emergencyContact1, emergencyContact2, bloodGroup, dob, profilePictureUrl;

  UserData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.emergencyContact1,
    required this.emergencyContact2,
    required this.bloodGroup,
    required this.dob,
    required this.profilePictureUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      address: json['address'],
      emergencyContact1: json['emergencyContact1'],
      emergencyContact2: json['emergencyContact2'],
      bloodGroup: json['bloodGroup'],
      dob: json['dob'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }
}

