class User {
    int? id;
    String? username;
    String? email;
    String? contactNumber;
    String? address;
    String? nationalIdNumber;
    int? cityId;
    String? drivingLicenseNumber;
    bool? isActive;

    User(
        {this.id,
        this.username,
        this.email,
        this.contactNumber,
        this.address,
        this.nationalIdNumber,
        this.cityId,
        this.drivingLicenseNumber,
        this.isActive}
    );

    User.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        username = json['username'];
        email = json['email'];
        contactNumber = json['contact_number'];
        address = json['address'];
        nationalIdNumber = json['national_id_number'];
        cityId = json['city_id'];
        drivingLicenseNumber = json['driving_license_number'];
        isActive = json['is_active'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['username'] = this.username;
        data['email'] = this.email;
        data['contact_number'] = this.contactNumber;
        data['address'] = this.address;
        data['national_id_number'] = this.nationalIdNumber;
        data['city_id'] = this.cityId;
        data['driving_license_number'] = this.drivingLicenseNumber;
        data['is_active'] = this.isActive;
        return data;
    }
}