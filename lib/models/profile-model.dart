class Profile {
  int? id;
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

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    gender = json['gender'] as String?;
    dob = json['dob'] as String?;
    vehicleName = json['vehicle_name'] as String?;
    description = json['description'] as String?;
    vehicleModel = json['vehicle_model'] as String?;
    vehicleMake = json['vehicle_make'] as String?;
    userId = json['user_id'] as int?;
    drivingHabit = json['driving_habit'] as String?;
    medicalCondition = json['medical_condition'] as String?;
    medicalNotes = json['medical_notes'] as String?;
    medications = json['medications'] as String?;
    allergies = json['allergies'] as String?;
    organDonor = json['organ_donor'] as String?;
    weight = json['weight'] as String?;
    height = json['height'] as String?;
    address = json['address'] as String?;
    nationalIdNumber = json['national_id_number'] as String?;
    cityId = json['city_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }
}
