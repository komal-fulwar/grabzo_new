import 'package:grabzo/model/Address.dart';

class ProfileBean {
  String name;
  String email;
  int phoneNumber;
  String createdAt;
  String updatedAt;
  Address address;

  ProfileBean(
      {this.name,
      this.email,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.address});

  ProfileBean.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}
