class Address {
  String fullName;
  int phoneNumber;
  String street1;
  String street2;
  String landmark;
  String city;
  String state;
  String country;
  int pin;
  String longitude;
  String latitude;
  String createdAt;
  String updatedAt;

  Address(
      {this.fullName,
      this.phoneNumber,
      this.street1,
      this.street2,
      this.landmark,
      this.city,
      this.state,
      this.country,
      this.pin,
      this.longitude,
      this.latitude,
      this.createdAt,
      this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    street1 = json['street1'];
    street2 = json['street2'];
    landmark = json['landmark'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pin = json['pin'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['street1'] = this.street1;
    data['street2'] = this.street2;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pin'] = this.pin;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
