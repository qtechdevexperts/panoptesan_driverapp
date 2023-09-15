import 'package:panoptesan_alpha/models/videomodel.dart';

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
  bool? notification_enable = false;
  bool? crash_enable = false;
  FleetUser? fleetUser;
  List<UserContact>? userContacts;
  List<VideoModel>? videosclips;

  Profile(
      {this.id,
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
      this.fleetUser,
      this.videosclips,
      this.notification_enable,
      this.crash_enable
      });

  factory Profile.fromJson(Map<String, dynamic> json) {
    List<UserContact>? userContactsList;
    List<VideoModel>? videosclips;
    if (json['user_contacts'] != null) {
      userContactsList = [];
      json['user_contacts'].forEach((contact) {
        userContactsList!.add(UserContact.fromJson(contact));
      });
    }
    if (json['video_clips'] != null) {
      videosclips = [];
      json['video_clips'].forEach((contact) {
        videosclips!.add(VideoModel.fromJson(contact));
      });
    }
    return Profile(
        id: json['id'],
        username: json['username'] ?? "",
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
        notification_enable: json['notification_enable']?? false,
          crash_enable: json['crash_enable']?? false,
        userDetail: json['user_detail'] == null
            ? null
            : UserDetail.fromJson(json['user_detail']),
        fleetUser: json['fleet_user'] == null
            ? null
            : FleetUser.fromJson(json['fleet_user']),
        userContacts: userContactsList,
        videosclips: videosclips);
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

class FleetUser {
  FleetUser({
    required this.id,
    required this.username,
    required this.email,
    this.contactNumber,
    this.address,
    this.nationalIdNumber,
    required this.cityId,
    this.drivingLicenseNumber,
    required this.isActive,
    required this.createdAt,
    this.invitedBy,
    required this.isFleet,
    required this.updatedAt,
    required this.userDetail,
    required this.videoClips,
  });
  late final int id;
  late final String? username;
  late final String email;
  late final Null contactNumber;
  late final Null address;
  late final Null nationalIdNumber;
  late final int cityId;
  late final Null drivingLicenseNumber;
  late final bool isActive;
  late final String createdAt;
  late final Null invitedBy;
  late final bool isFleet;
  late final String updatedAt;
  late final UserDetail userDetail;

  late final List<dynamic> videoClips;

  FleetUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username']??"";
    email = json['email'];
    contactNumber = null;
    address = null;
    nationalIdNumber = null;
    cityId = json['city_id'] ?? 0;
    drivingLicenseNumber = null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    invitedBy = null;
    isFleet = json['is_fleet'];
    updatedAt = json['updated_at'];
    userDetail = UserDetail.fromJson(json['user_detail']);

    videoClips = List.castFrom<dynamic, dynamic>(json['video_clips']);
  }
}
