class UserModel {
  final int id;
  final String username;
  final String email;
  final String? contactNumber;
  final String? address;
  final String? nationalIdNumber;
  final int cityId;
  final String? drivingLicenseNumber;
  final bool isActive;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.contactNumber,
    this.address,
    this.nationalIdNumber,
    required this.cityId,
    this.drivingLicenseNumber,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      contactNumber: json['contact_number'],
      address: json['address'],
      nationalIdNumber: json['national_id_number'],
      cityId: json['city_id'] ?? 0,
      drivingLicenseNumber: json['driving_license_number'],
      isActive: json['is_active'] ?? true,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'contactNumber': contactNumber,
      'address': address,
      'nationalIdNumber': nationalIdNumber,
      'cityId': cityId,
      'drivingLicenseNumber': drivingLicenseNumber,
      'isActive': isActive,
    };
  }
}
