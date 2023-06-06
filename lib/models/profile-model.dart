class UserResponse {
  bool? status;
  int? code;
  String? message;
  Profile? data;

  UserResponse({this.status, this.code, this.message, this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: Profile.fromJson(json['data']),
    );
  }
}

class Profile {
  int? id;
  String? username;
  String? email;
  String? contactNumber;
  String? password;
  String? address;
  String? nationalIdNumber;
  int? cityId;
  String? drivingLicenseNumber;
  bool? isActive;
  String? createdAt;
  dynamic createdBy;
  bool? isFleet;
  String? updatedAt;
  UserDetail? userDetail;
  List<UserContact>? userContacts;

  Profile({
    this.id,
    this.username,
    this.email,
    this.contactNumber,
    this.password,
    this.address,
    this.nationalIdNumber,
    this.cityId,
    this.drivingLicenseNumber,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.isFleet,
    this.updatedAt,
    this.userDetail,
    this.userContacts,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    List<UserContact>? userContactsList;
    if (json['user_contacts'] != null) {
      userContactsList = [];
      json['user_contacts'].forEach((contact) {
        userContactsList!.add(UserContact.fromJson(contact));
      });
    }

    return Profile(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      contactNumber: json['contact_number'],
      password: json['password'],
      address: json['address'],
      nationalIdNumber: json['national_id_number'],
      cityId: json['city_id'],
      drivingLicenseNumber: json['driving_license_number'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      isFleet: json['is_fleet'],
      updatedAt: json['updated_at'],
      userDetail: UserDetail.fromJson(json['user_detail']),
      userContacts: userContactsList,
    );
  }
}

class UserDetail {
  int? id;
  String? coverImg;
  String? profileImg;
  String? name;
  String? gender;
  String? dob;
  String? vehicleName;
  String? description;
  String? vehicleModel;
  String? vehicleMake;
  int? userId;
  String? drivingHabit;
  String? medicalCondition;
  String? medicalNotes;
  String? medications;
  String? allergies;
  String? organDonor;
  String? weight;
  String? height;
  String? address;
  String? nationalIdNumber;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  UserDetail({
    this.id,
    this.coverImg,
    this.profileImg,
    this.name,
    this.gender,
    this.dob,
    this.vehicleName,
    this.description,
    this.vehicleModel,
    this.vehicleMake,
    this.userId,
    this.drivingHabit,
    this.medicalCondition,
    this.medicalNotes,
    this.medications,
    this.allergies,
    this.organDonor,
    this.weight,
    this.height,
    this.address,
    this.nationalIdNumber,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      coverImg: json['cover_img'],
      profileImg: json['profile_img'],
      name: json['name'],
      gender: json['gender'],
      dob: json['dob'],
      vehicleName: json['vehicle_name'],
      description: json['description'],
      vehicleModel: json['vehicle_model'],
      vehicleMake: json['vehicle_make'],
      userId: json['user_id'],
      drivingHabit: json['driving_habit'],
      medicalCondition: json['medical_condition'],
      medicalNotes: json['medical_notes'],
      medications: json['medications'],
      allergies: json['allergies'],
      organDonor: json['organ_donor'],
      weight: json['weight'],
      height: json['height'],
      address: json['address'],
      nationalIdNumber: json['national_id_number'],
      cityId: json['city_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class UserContact {
  int? id;
  int? userId;
  String? name;
  String? relationship;
  String? number;
  String? createdAt;
  String? updatedAt;

  UserContact({
    this.id,
    this.userId,
    this.name,
    this.relationship,
    this.number,
    this.createdAt,
    this.updatedAt,
  });

  factory UserContact.fromJson(Map<String, dynamic> json) {
    return UserContact(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      relationship: json['relationship'],
      number: json['number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
